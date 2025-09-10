import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/api_success_model.dart';
import '../../home_insurance_screen/models/coupon_response_model.dart';
import '../../payment_method_screen/models/payment_data_model.dart';
import '../models/car_insurance_details_model.dart';
import '../models/car_insurance_return_model.dart';

class TypeModel {
  String? name;
  String? value;
  TypeModel({this.name, this.value});
}

class CarInsuranceController extends GetxController {
  // Stepper State
  var currentStep = 0.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController carNumberPlateController = TextEditingController();
  TextEditingController carSeatController = TextEditingController();
  TextEditingController manufactureYearController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();
  TextEditingController carValueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController carRegistrationDocumentController =
      TextEditingController();
  TextEditingController ownerIdDocumentController = TextEditingController();

  ///coupon
  TextEditingController couponController = TextEditingController();
  // Form Fields
  Rx<DateTime> dob = DateTime.now().obs;
  var carRegistrationDocument = ''.obs;
  var ownerIdDocument = ''.obs;
  var gender = ''.obs;
  var forOwn = true.obs;

  var acceptCondition = false.obs;
  var start = ''.obs;
  var end = ''.obs;
  var personalAccidentCoverage = false.obs;
  var roadSideAssistanceCoverage = false.obs;

  var description = ''.obs;
  var carBrand = Brand().obs;
  var carModel = Brand().obs;

  var image = ''.obs;

  var totalPremium = 0.0.obs;
  var discountAmount = 0.0.obs;
  var subTotalAmount = 0.0.obs;
  var premiumRate = 0.0.obs;
  var deductible = 0.0.obs;
  var minPremium = 0.0.obs;
  var conditions = ''.obs;
  var planType = ''.obs;

  var isInstallment = false.obs;
  var installmentMonth = 0.obs;
  var selectInstallment = false.obs;
  var installmentPerMonth = 0.0.obs;
  Rx<Insurance> detailsModelData = Insurance().obs;
  RxList<Brand> carBrandList = <Brand>[].obs;
  RxList<Brand> carModelAllList = <Brand>[].obs;
  RxList<Brand> carModelList = <Brand>[].obs;
  var isLoading = false.obs;
  var showMainForm = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxList<XFile> images = <XFile>[].obs;
//dropdownlist
  Rx<TypeModel> selectDropDown = TypeModel().obs;
  List<TypeModel> planList = [
    TypeModel(name: 'Plan A', value: 'lbl_plan_a'),
    TypeModel(name: 'Plan B', value: 'lbl_plan_b'),
    TypeModel(name: 'Plan C', value: 'lbl_plan_c'),
    TypeModel(name: 'Plan D', value: 'lbl_plan_d'),
  ];

  void selectCarBrand(Brand? value) {
    carBrand.value = value!;
    carModelList.value = [];
    for (int i = 0; i < carModelAllList.length; i++) {
      debugPrint("Car Model ${value.id}");
      debugPrint("Car Model 2 ${carModelAllList[i].name}");
      if (carModelAllList[i].carBrandId.toString() == value.id.toString()) {
        debugPrint("******** TRUE ********");
        carModelList.add(carModelAllList[i]);
        debugPrint("******** ${carModelList.length} ********");
      }
    }
  }

  void selectPlan(TypeModel plan) {
    selectDropDown.value = plan;
    if (plan.name == 'Plan A') {
      planType.value = 'Plan A';
      premiumRate.value = double.parse(detailsModelData.value.aRate.toString());
      deductible.value =
          double.parse(detailsModelData.value.aDeductible.toString());
    } else if (plan.name == 'Plan B') {
      planType.value = 'Plan B';
      premiumRate.value = double.parse(detailsModelData.value.bRate.toString());
      deductible.value = double.parse(detailsModelData.value.bRate.toString());
    } else if (plan.name == 'Plan C') {
      planType.value = 'Plan C';
      premiumRate.value = double.parse(detailsModelData.value.cRate.toString());
      deductible.value =
          double.parse(detailsModelData.value.cDeductible.toString());
    } else if (plan.name == 'Plan D') {
      planType.value = 'Plan D';
      premiumRate.value = double.parse(detailsModelData.value.dRate.toString());
      deductible.value =
          double.parse(detailsModelData.value.dDeductible.toString());
    }
  }

  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  // Future<void> selectImages() async {
  //   final List<XFile>? selectedImages = await _picker.pickMultiImage();
  //   if (selectedImages != null) {
  //     images.assignAll(selectedImages ?? []);
  //     Get.snackbar(
  //       'Success',
  //       'All Images Upload Successful',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  List<XFile> cameraImages = [];

  Future<void> selectImages() async {
    bool _isPicking = false;

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        cameraImages.add(image);
        images.assignAll(cameraImages);
      }
    } catch (e) {
      Get.snackbar('Error', 'Camera failed: $e');
    } finally {
      _isPicking = false;
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
    carDetails();
    // Load data when the controller is initialized
  }

  double calculatedTotalPremium() {
    double construction = reverseFormatAmount(
        carValueController.text.isNotEmpty ? carValueController.text : '0');
    debugPrint("## construction == $construction");
    debugPrint("## premiumRate.value == ${premiumRate.value}");
    debugPrint("## minPremium.value == ${minPremium.value}");
    double value = (construction * premiumRate.value) / 100;
    debugPrint("## value == ${value}");
    if (value < minPremium.value) {
      totalPremium.value = minPremium.value;
    } else {
      totalPremium.value = value;
    }
    subTotalAmount.value = totalPremium.value;
    return totalPremium.value;
  }

  double calculateInstallment() {
    installmentPerMonth.value =
        (totalPremium.value - discountAmount.value) / installmentMonth.value;

    if (installmentPerMonth.value.toString() == 'Infinity') {
      installmentPerMonth.value = 0;
    }
    return installmentPerMonth.value;
  }

  Future<void> carDetails() async {
    debugPrint("*************** carDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request(
          'GET', Uri.parse('$baseUrl/car-insurance/data/details-for-app'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("carDetails str = $str");
      if (response.statusCode == 200) {
        CarInsuranceDetailsModel detailsModel =
            CarInsuranceDetailsModel.fromJson(str);

        if (detailsModel.data != null) {
          detailsModelData.value = detailsModel.data!.insurance!;
          minPremium.value = double.parse(
              detailsModel.data?.insurance?.minimumRule.toString() ?? '0');
          carBrandList.value = [];
          carBrandList.assignAll(detailsModel.data?.brand ?? []);
          carModelAllList.assignAll(detailsModel.data?.model ?? []);
          conditions.value = detailsModel.data?.insurance?.termCondition ?? '';
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
    debugPrint("*************** car form  ***********");
    final acceptToken = storage.read('token');
    isLoading.value = true;
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/car-insurance-form'));

      request.fields.addAll({
        'name': nameController.text,
        'dob': dateController.text,
        'gender': gender.value,
        'email': emailController.text,
        'phone': phoneController.text,
        'for_own': '1',
        'car_brand': carBrand.value.name ?? '',
        'car_model': carModel.value.name ?? '',
        'manufacture_year': manufactureYearController.text,
        'chassis_number': chassisNumberController.text,
        'plan': planType.value,
        'car_value': reverseFormatAmount(carValueController.text).toString(),
        'personal_accident_coverage':
            personalAccidentCoverage.value ? '1' : '0',
        'roadside_assistance': roadSideAssistanceCoverage.value ? '1' : '0',
        'start': startController.text,
        'end': endController.text,
        'total_premium': (totalPremium.value - discountAmount.value).toString(),
        'is_installment': selectInstallment.value ? '1' : '0',
        'installment_month': installmentMonth.value.toString(),
        'installment_per_month': installmentPerMonth.value.toString(),
        'discount_code':
            discountAmount.value > 0 ? couponController.text.trim() : '',
        'discount_amount': discountAmount.value.toString(),
        'car_number': carNumberPlateController.text,
        'seat': carSeatController.text,
      });
      if (carRegistrationDocumentController.text.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'car_registration_document', carRegistrationDocument.value));
      }
      if (ownerIdDocumentController.text.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'owner_id_document', ownerIdDocument.value));
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

      debugPrint("request.fields  == ${request.fields}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 201) {
        debugPrint("str  == $str");
        final returnData = CarInsuranceFromResponse.fromJson(str);
        Get.snackbar(
          'Success',
          res.message ?? 'Form Submit Successful',
          snackPosition: SnackPosition.BOTTOM,
        );
        // Navigate to the car screen
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
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest(
          'GET',
          Uri.parse(
              '$baseUrl/user/coupon/applied?purchase_amount=$totalPremium&code=${couponController.text.trim()}&type=car'));

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
        subTotalAmount.value = totalPremium.value - discountAmount.value;
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
