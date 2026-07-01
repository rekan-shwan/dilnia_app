import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/api_success_model.dart';
import '../../home_insurance_screen/models/coupon_response_model.dart';
import '../../payment_method_screen/models/payment_data_model.dart';
import '../models/family_member_model.dart';
import '../models/travel_insurance_details_model.dart';
import '../models/travel_insurance_return_model.dart';

class TravelInsuranceController extends GetxController {
  // Stepper State
  var currentStep = 0.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passportDocumentController = TextEditingController();
  TextEditingController adultsNumberController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController purposeController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController childNumberController = TextEditingController();

  TextEditingController meetiningLocation = TextEditingController();

  ///coupon
  TextEditingController couponController = TextEditingController();
  // Form Fields
  Rx<DateTime> dob = DateTime.now().obs;
  var gender = ''.obs;
  var passportDocument = ''.obs;
  var age = 0.obs;
  var forOwn = true.obs;

  var acceptCondition = false.obs;
  var start = ''.obs;
  var end = ''.obs;
  var personalAccidentCoverage = false.obs;
  var roadSideAssistanceCoverage = false.obs;

  var description = ''.obs;

  final meetingLocation = ''.obs;

  var image = ''.obs;

  var userPremium = 0.0.obs;
  var familyPremium = 0.0.obs;
  var discountAmount = 0.0.obs;
  var subTotalAmount = 0.0.obs;
  var premiumRate = 0.0.obs;
  var period = 0.obs;

  var minPremium = 0.0.obs;
  var conditions = ''.obs;
  var catType = ''.obs;
  var planType = ''.obs;
  var planTypeId = 0.obs;
  var packageId = 0.obs;

  var isInstallment = false.obs;
  var installmentMonth = 0.obs;
  var selectInstallment = false.obs;
  var installmentPerMonth = 0.0.obs;
//dropdownlist
  List<String> catList = ['Covid19', 'My Journey'];
  List<String> covid19PlanList = ['Silver', 'Gold'];
  List<String> myJourneyPlanList = ['Range1', 'Range2', 'Range3'];

  // RxList<String> planList = <String>[].obs;
  //List<String> planList = ['My Health', 'My Health +', 'My Health ++'];
  RxList<FamilyMemberModel> familyPlanList = <FamilyMemberModel>[].obs;

  void selectCat(String plan) {
    planType.value = '';
    catType.value = plan;
  }

  void selectPlan(String plan) {
    planType.value = plan;

    PackagePackage? pack =
        getPlanDetails(dateController.text.trim(), planType.value);
    if (pack != null) {
      debugPrint(" pack.price  == ${pack.price}");
      userPremium.value = double.parse(pack.price.toString());
      packageId.value = pack.id ?? 0;
    }
  }

  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  Rx<TravelInsuranceDetailsModel> detailsModelData =
      TravelInsuranceDetailsModel().obs;

  RxList<TravelDataPackage> travelDataPackageList = <TravelDataPackage>[].obs;

  var isLoading = false.obs;
  var showMainForm = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxList<XFile> images = <XFile>[].obs;

  Future<void> selectImages() async {
    final XFile? selectedImages =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImages != null) {
      passportDocument.value = selectedImages.path;
      images.add(selectedImages);
      // Get.snackbar(
      //   'Success',
      //   'All Images Upload Successful',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget()
          .showSnackBar(Get.context!, 'All Images Upload Successful');
    }
  }

  saveFamilyMemberInList(FamilyMemberModel fmData) {
    familyPremium.value = familyPremium.value + fmData.premium;
    familyPlanList.add(fmData);
  }

  deleteFamily(index) {
    FamilyMemberModel fmData = familyPlanList[index];
    familyPremium.value = familyPremium.value - fmData.premium;
    familyPlanList.removeAt(index);
    familyPlanList.refresh();
  }

  PackagePackage? getPlanDetails(String dob, String plan) {
    period.value = daysBetween(startController.text, endController.text);

    for (int i = 0; i < travelDataPackageList.length; i++) {
      if (travelDataPackageList[i].plan.toString().contains(plan)) {
        for (int j = 0; j < travelDataPackageList[i].packages!.length; j++) {
          if ((travelDataPackageList[i].packages?[j].ageFrom ?? 0) <=
                  calculateAge(dob) &&
              (travelDataPackageList[i].packages?[j].ageTo ?? 0) >=
                  calculateAge(dob)) {
            if ((travelDataPackageList[i].packages?[j].periodFrom ?? 0) <=
                    period.value &&
                (travelDataPackageList[i].packages?[j].periodTo ?? 0) >=
                    period.value) {
              return travelDataPackageList[i].packages?[j];
            }
          }
        }
      }
    }
    return null;
  }

  // Local storage
  final storage = GetStorage();
  // Stepper Navigation
  void onStepTapped(int value) {
    currentStep.value = value;
  }

  void nextStep() {
    if (currentStep.value < 3) {
      if (formKeys[currentStep.value].currentState!.validate()) {
        currentStep.value++;
      }
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    travelDetails();
    // Load data when the controller is initialized
  }

  double calculatedTotalPremium() {
    return familyPremium.value + userPremium.value;
  }

  double calculateInstallment() {
    installmentPerMonth.value =
        (familyPremium.value + userPremium.value - discountAmount.value) /
            installmentMonth.value;
    if (installmentPerMonth.value.toString() == 'Infinity') {
      installmentPerMonth.value = 0;
    }
    return installmentPerMonth.value;
  }

  Future<void> travelDetails() async {
    debugPrint("*************** travelDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request(
          'GET', Uri.parse('$baseUrl/travel-insurance/data/details'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("travelDetails str = $str");
      if (response.statusCode == 200) {
        TravelInsuranceDetailsModel detailsModel =
            TravelInsuranceDetailsModel.fromJson(str);
        detailsModelData.value = detailsModel;
        travelDataPackageList.assignAll((detailsModel.data?.package ?? []));
        if (detailsModel.data != null) {
          conditions.value = detailsModel.data?.data?.termCondition ?? '';
        }

        // Get.snackbar(
        //   'Success',
        //   'Get Details Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        // Get.snackbar(
        //   'Error',
        //   'Failed to get Details. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(
            Get.context!, 'Failed to get Details. Please try again later.');
      }
    } catch (e) {
      debugPrint('Something went wrong: $e');
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Submit
  Future<void> submitForm() async {
    debugPrint("*************** travel form  ***********");
    final acceptToken = storage.read('token');
    isLoading.value = true;
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/travel-insurance-form'));

      request.fields.addAll({
        'name': nameController.text,
        'middle_name': middleNameController.text,
        'last_name': lastNameController.text,
        'dob': dateController.text,
        'gender': gender.value,
        'email': emailController.text,
        'phone': phoneController.text,
        'for_own': familyPlanList.isNotEmpty ? '0' : '1',
        'plan_type': planTypeId.toString(),
        'period': period.value.toString(),
        'adults_number': adultsNumberController.text.isNotEmpty
            ? adultsNumberController.text
            : '0',
        'child_number': childNumberController.text.isNotEmpty
            ? childNumberController.text
            : '0',
        'destination': destinationController.text,
        'purpose': purposeController.text,
        'start': startController.text,
        'end': endController.text,
        'total_premium':
            (familyPremium.value + userPremium.value - discountAmount.value)
                .toString(),
        'discount_code': '',
        'travel_insurance_package_id': packageId.toString(),
        'is_installment': selectInstallment.value ? '1' : '0',
        'installment_month': installmentMonth.value.toString(),
        'installment_per_month': installmentPerMonth.value.toString(),
        'nationality': nationalityController.text,
        'phone_code': phoneCodeController.text,
        'passport_number': passportNumberController.text,
        'premium': userPremium.value.toString()
      });
      if (passportDocumentController.text.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'passport_document', passportDocument.value));
      }

      if (image.value.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.value));
      }
      if (images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          request.files.add(
              await http.MultipartFile.fromPath('images[$i]', images[i].path));
        }
      }
      if (familyPlanList.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          request.fields.addAll({
            'families[$i][name]': familyPlanList[i].name!,
            'families[$i][dob]': familyPlanList[i].dob!.toString(),
            'families[$i][gender]': familyPlanList[i].gender!,
            'families[$i][email]': familyPlanList[i].email!,
            'families[$i][phone]': familyPlanList[i].phone!,
            'families[$i][relation]': familyPlanList[i].relation!,
            'families[$i][nationality]': familyPlanList[i].nationality!,
            'families[$i][passport_number]': familyPlanList[i].passportNumber!,
            'families[$i][premium]': familyPlanList[i].premium!.toString(),
            'families[$i][travel_insurance_package_id]':
                familyPlanList[i].travelInsurancePackageId!.toString(),
          });
        }
      }

      debugPrint("request.fields  == ${request.fields}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      final res = ApiSuccessResponseModel.fromJson(str);
      debugPrint("Travel res == $str");
      if (response.statusCode == 201) {
        debugPrint("Travel str  == $str");
        final returnData = TravelFormResponse.fromJson(str);
        // Get.snackbar(
        //   'Success',
        //   res.message ?? 'Form Submit Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(
            Get.context!, res.message ?? 'Form Submit Successful');
        // Navigate to the travel screen
        Get.toNamed(AppRoutes.paymentMethodScreen,
            arguments: PaymentDataModel(
                amount: returnData.data?.paymentData?[0].amount ?? '0',
                firstName: returnData.data?.data?.name ?? 'User',
                invoiceId: returnData.data?.paymentData?[0].invoice ?? '0',
                lastName: '',
                userpaymentId: returnData.data?.paymentData?[0].id ?? 0));
      } else {
        // Get.snackbar(
        //   'Error',
        //   res.message ?? 'Failed to submit. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to submit. Please try again later.');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitCoupon() async {
    debugPrint("*************** coupon form  ***********");
    final acceptToken = storage.read('token');
    isLoading.value = true;
    double totalPremium = familyPremium.value + userPremium.value;
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              '$baseUrl/user/coupon/applied?purchase_amount=$totalPremium&code=${couponController.text.trim()}&type=travel'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("*************** coupon form 3 $str***********");
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 200) {
        debugPrint("coupon str  == $str");
        CouponModel data = CouponModel.fromJson(str);
        discountAmount.value =
            double.parse(data.data!.discountAmount.toString());
        subTotalAmount.value =
            familyPremium.value + userPremium.value - discountAmount.value;
        couponController.clear();
        debugPrint("coupon subTotalAmount  == ${subTotalAmount.value}");
        update();
        // Get.snackbar(
        //   'Success',
        //   data.message ?? 'Coupon Added',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget()
            .showSnackBar(Get.context!, data.message ?? 'Coupon Added');
        // Navigate to the home screen
      } else {
        // Get.snackbar(
        //   'Error',
        //   res.message ?? 'Failed to submit. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to submit. Please try again later.');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
