import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/api_success_model.dart';
import '../../home_insurance_screen/models/coupon_response_model.dart';
import '../../home_insurance_screen/models/home_insurance_form_return_model.dart';
import '../../payment_method_screen/models/payment_data_model.dart';
import '../models/family_member_model.dart';
import '../models/medical_insurance_details_model.dart';
import '../models/medical_insurance_model.dart';

class MedicalInsuranceController extends GetxController {
  // Stepper State
  var currentStep = 0.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController medicalRegistrationDocumentController =
      TextEditingController();
  TextEditingController ownerIdDocumentController = TextEditingController();

  ///coupon
  TextEditingController couponController = TextEditingController();
  // Form Fields
  Rx<DateTime> dob = DateTime.now().obs;
  var medicalRegistrationDocument = ''.obs;
  var ownerIdDocument = ''.obs;
  var gender = ''.obs;
  var age = 0.obs;
  var forOwn = true.obs;

  var acceptCondition = false.obs;
  var start = ''.obs;
  var end = ''.obs;
  var personalAccidentCoverage = false.obs;
  var roadSideAssistanceCoverage = false.obs;

  var description = ''.obs;

  var image = ''.obs;

  var userPremium = 0.0.obs;
  var familyPremium = 0.0.obs;
  var premiumRate = 0.0.obs;

  var discountAmount = 0.0.obs;
  var subTotalAmount = 0.0.obs;
  var minPremium = 0.0.obs;
  var conditions = ''.obs;
  var planType = ''.obs;
  var planTypeId = 0.obs;
  var packageId = 0.obs;

  var isInstallment = false.obs;
  var installmentMonth = 0.obs;
  var selectInstallment = false.obs;
  var installmentPerMonth = 0.0.obs;

//dropdownlist
  List<String> conditionList = [
    'Circulatory or heart disease: high blood  pressure, arrhythmia, murmur, infarction...etc.',
    'Respiratory disease or allergy: asthma,  bronchitis, emphysema, ...etc  /except  cancer',
    'Digestive disease: constipation, diarrhea, hepatitis, ulcers, pancreatitis...etc /except  cancer',
    'Renal or urinary disease: nephritis,  stones, renal colic, albuminuria, hematuria /except cance',
    'Osteo-articular disease,   disease  of hip or vertebral column (scoliosis,  rheumatism, slipped disc...  etc.) /except',
    'Neurological, cerebral, or muscular disease: epilepsy, meningitis, aneurysm,  paralysis...etc /except  cancer',
    'Endocrinal or metabolic disease: goiter,  nodules, diabetes, cholesterol, gout...etc /except cancer',
    'Eye, nose & throat disease: glaucoma, retinopathy, dizziness, otitis, laryngitis, sinusitis...etc /except  cancer',
    'Blood,  ganglionic  or skin disease: anemia,  hemophilia, adenopathy, eczema, herpes, etc.',
    'Sexual disease: AIDS, gonorrhea, syphilis ...etc.',
    'Tumors or swelling:  ﬁbroma, cyst, lipoma,  cancer...etc',
    'Any other  disease, past or future operation,  accident  or treatment not mentioned above',
    'Psychical disease: nervous  depression, fatigue, insomnia, psychosis...etc.',
    'For female applicant, are you pregnant?  If yes please state the  expected due date?S',
    'Congenital  anomalies,  hereditary/genetic  diseases'
  ];
  RxList<String> selectedConditionList = <String>[].obs;
  bool isConditionSelected(String value) {
    debugPrint("isConditionSelected == $value");
    return selectedConditionList.contains(value);
  }

  addCondition(String value) {
    debugPrint("addCondition == $value");
    selectedConditionList.add(value);
  }

  removeCondition(String value) {
    debugPrint("removeCondition == $value");
    selectedConditionList.removeWhere(
      (element) {
        return element == value;
      },
    );
    ;
  }
  // List<String> covid19PlanList = ['Silver', 'Gold'];
  // List<String> myJourneyPlanList = ['Range 1', 'Range 2', 'Range 3'];

  // RxList<String> planList = <String>[].obs;
  List<String> planList = ['My Health', 'My Health +', 'My Health ++'];
  RxList<FamilyMemberModel> familyPlanList = <FamilyMemberModel>[].obs;

  void selectPlan(String plan) {
    planType.value = plan;
    planTypeId.value = planList.indexOf(plan) + 1;
    PackagePackage? pack =
        getPlanDetails(dateController.text.trim(), planTypeId.value);
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
  Rx<MedicalInsuranceDetailsModel> detailsModelData =
      MedicalInsuranceDetailsModel().obs;

  RxList<MedicalDataPackage> medicalDataPackageList =
      <MedicalDataPackage>[].obs;

  var isLoading = false.obs;
  var showMainForm = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxList<XFile> images = <XFile>[].obs;

  Future<void> selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      images.assignAll(selectedImages ?? []);
      Get.snackbar(
        'Success',
        'All Images Upload Successful',
        snackPosition: SnackPosition.BOTTOM,
      );
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

  PackagePackage? getPlanDetails(String dob, int planId) {
    for (int i = 0; i < medicalDataPackageList.length; i++) {
      if (medicalDataPackageList[i].plan.toString() == planId.toString()) {
        for (int j = 0; j < medicalDataPackageList[i].packages!.length; j++) {
          if ((medicalDataPackageList[i].packages?[j].age ?? 0) >=
              calculateAge(dob)) {
            return medicalDataPackageList[i].packages?[j];
          }
        }
      }
    }
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
    medicalDetails();
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

  Future<void> medicalDetails() async {
    debugPrint("*************** medicalDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request(
          'GET', Uri.parse('$baseUrl/medical-insurance/data/details'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("medicalDetails str = $str");
      if (response.statusCode == 200) {
        MedicalInsuranceDetailsModel detailsModel =
            MedicalInsuranceDetailsModel.fromJson(str);
        detailsModelData.value = detailsModel;
        medicalDataPackageList.assignAll((detailsModel.data?.package ?? []));
        if (detailsModel.data != null) {
          conditions.value = detailsModel.data?.data?.termCondition ?? '';
        }

        // Get.snackbar(
        //   'Success',
        //   'Get Details Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        Get.snackbar(
          'Error',
          'Failed to get Details. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('Something went wrong: $e');
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Submit
  Future<void> submitForm() async {
    debugPrint("*************** medical form  ***********");
    final acceptToken = storage.read('token');
    debugPrint(
        "*************** medical acceptToken ${selectedConditionList.length}  ***********");
    isLoading.value = true;
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/medical-insurance-form'));
      debugPrint("*************** medical form 22 ***********");
      request.fields.addAll({
        'name': nameController.text,
        'dob': dateController.text,
        'gender': gender.value,
        'email': emailController.text,
        'phone': phoneController.text,
        'medical_condition': jsonEncode(selectedConditionList),
        'for_own': familyPlanList.isNotEmpty ? '0' : '1',
        'plan_type': planTypeId.toString(),
        'start': startController.text,
        'end': endController.text,
        'total_premium':
            (familyPremium.value + userPremium.value - discountAmount.value)
                .toString(),
        'discount_code':
            discountAmount.value > 0 ? couponController.text.trim() : '',
        'medical_insurance_package_id': packageId.toString(),
        'coverage_area': 'Local',
        'is_installment': selectInstallment.value ? '1' : '0',
        'installment_month': installmentMonth.value.toString(),
        'installment_per_month': installmentPerMonth.value.toString(),
        'premium': userPremium.value.toString()
      });
      if (medicalRegistrationDocumentController.text.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'document', medicalRegistrationDocument.value));
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
            'families[$i][medical_condition]':
                jsonEncode(familyPlanList[i].medicalCondition!),
            'families[$i][premium]': familyPlanList[i].premium!.toString(),
            'families[$i][medical_insurance_package_id]':
                familyPlanList[i].medicalInsurancePackageId!.toString(),
          });
        }
      }

      debugPrint("request.fields  == ${request.fields}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 201) {
        debugPrint("str  == $str");
        final returnData = MedicalFormResponse.fromJson(str);

        Get.snackbar(
          'Success',
          res.message ?? 'Form Submit Successful',
          snackPosition: SnackPosition.BOTTOM,
        );

        // Navigate to the medical screen
        Get.toNamed(AppRoutes.paymentMethodScreen,
            arguments: PaymentDataModel(
                amount: returnData.data?.paymentData?[0].amount ?? '0',
                firstName: returnData.data?.data?.name ?? 'User',
                invoiceId: returnData.data?.paymentData?[0].invoice ?? '0',
                lastName: '',
                userpaymentId: returnData.data?.paymentData?[0].id ?? 0));
      } else {
        Get.snackbar(
          'Error',
          res.message ?? 'Failed to submit. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
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
              '$baseUrl/user/coupon/applied?purchase_amount=$totalPremium&code=${couponController.text.trim()}&type=medical'));

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
        Get.snackbar(
          'Success',
          data.message ?? 'Coupon Added',
          snackPosition: SnackPosition.BOTTOM,
        );
        // Navigate to the home screen
      } else {
        Get.snackbar(
          'Error',
          res.message ?? 'Failed to submit. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
