import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/api_success_model.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../../payment_method_screen/models/payment_data_model.dart';
import '../models/coupon_response_model.dart';
import '../models/home_insurance_details_model.dart';
import '../models/home_insurance_form_return_model.dart';

class HomeInsuranceController extends GetxController {
  // Stepper State
  var currentStep = 0.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController propertyFloorController = TextEditingController();
  TextEditingController propertyBlockController = TextEditingController();
  TextEditingController propertyAreaController = TextEditingController();
  TextEditingController propertyProjectController = TextEditingController();
  TextEditingController propertyAlleyController = TextEditingController();
  TextEditingController propertyApartmentController = TextEditingController();
  TextEditingController propertyHouseController = TextEditingController();
  TextEditingController propertyStreetController = TextEditingController();
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController contentValueController = TextEditingController();
  TextEditingController constructionValueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController propertyOwnerDocumentController =
      TextEditingController();
  TextEditingController inventoryListDocumentController =
      TextEditingController();

  ///coupon
  TextEditingController couponController = TextEditingController();
  List<String> provinces = [
    "Duhok",
    "Sulaymaniyah",
    "Erbil",
    "Mosul",
    "Kirkuk",
    "Diyala",
    "Al Anbar",
    "Baghdad",
    "Salah ad Din",
    "Karbala",
    "Najaf",
    "Al-Muthana",
    "Wasit",
    "Al-Qādisiyyah",
    "Maysan",
    "Dhi Qar",
    "Babil",
    "Basra",
    "Halabja"
  ];
  // Form Fields
  Rx<DateTime> dob = DateTime.now().obs;
  var propertyOwnerDocument = ''.obs;
  var inventoryListDocument = ''.obs;
  var gender = ''.obs;
  var forOwn = true.obs;

  var homeType = ''.obs;
  var province = ''.obs;
  var propertyType = ''.obs;
  var propertyAddress = ''.obs;

  var liabilityCoverage = false.obs;
  var contentCoverage = false.obs;

  var acceptCondition = false.obs;
  var start = ''.obs;
  var end = ''.obs;
  var personalLiabilityCoverage = false.obs;
  var fireTheftLiabilityCoverage = false.obs;

  var description = ''.obs;

  var image = ''.obs;

  var totalPremium = 0.0.obs;
  var discountAmount = 0.0.obs;
  var subTotalAmount = 0.0.obs;
  var premiumRate = 0.0.obs;
  var minPremium = 50000.0.obs;
  var conditions = ''.obs;

  var isInstallment = false.obs;
  var installmentMonth = 0.obs;
  var selectInstallment = false.obs;
  var installmentPerMonth = 0.0.obs;
  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  Rx<HomeInsuranceDetailsModel> detailsModelData =
      HomeInsuranceDetailsModel().obs;
  var isLoading = false.obs;
  var showMainForm = false.obs;
  final ImagePicker _picker = ImagePicker();
  RxList<XFile> images = <XFile>[].obs;

  Future<void> selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      images.assignAll(selectedImages ?? []);

      SnackBarWidget()
          .showSnackBar(Get.context!, 'All Images Upload Successful');
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
      // if (formKeys[currentStep.value].currentState!.validate()) {

      // }
    }
  }

  @override
  void onInit() {
    super.onInit();
    homeDetails();
    // Load data when the controller is initialized
  }

  void showCustomDialog() {
    liabilityCoverage.value = true;
    contentCoverage.value = true;
    personalLiabilityCoverage.value = true;
    fireTheftLiabilityCoverage.value = true;

    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: SizedBox(
          height: Get.height - 300,
          width: Get.width,
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Material(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(32, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "lbl_your_coverage".tr,
                        style: CustomTextStyles.titleLargeBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),

              // Content Scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle("Coverage Includes".tr),
                      _buildCoverageCard([
                        _buildCoverageItemWithIcon(
                            "Fire & Lightening".tr,
                            "Up to total sum issued".tr,
                            Icons.local_fire_department),
                        _buildCoverageItemWithIcon("Domestic Explosion".tr,
                            "Up to total sum issued".tr, Icons.warning),
                        _buildCoverageItemWithIcon("Earthquake".tr,
                            "Up to total sum issued".tr, Icons.public),
                        _buildCoverageItemWithIcon("Storm, Tempest & Flood".tr,
                            "Up to total sum issued".tr, Icons.water_drop),
                        _buildCoverageItemWithIcon("Neighbors Recourse".tr,
                            "Up to IQD 7,500,000".tr, Icons.people_outline),
                        _buildCoverageItemWithIcon(
                            "Water damage (bursting of pipes and overflowing of water tanks)"
                                .tr,
                            "Up to IQD 7,500,000".tr,
                            Icons.water_damage),
                        _buildCoverageItemWithIcon(
                            "Burglary (within Kurdistan Region only)".tr,
                            "Up to IQD 7,500,000".tr,
                            Icons.lock_outline),
                      ]),
                      const SizedBox(height: 30),
                      _buildSectionTitle("Deductions & Conditions".tr,
                          color: Colors.red),
                      _buildCoverageCard([
                        _buildCoverageItemWithIcon(
                          "Fire, Storm, Flood, Neighbors Recourse, Water Damage, Burglary"
                              .tr,
                          "10% each and every loss (min. IQD 375,000)".tr,
                          Icons.remove_circle_outline,
                          isRed: true,
                        ),
                        _buildCoverageItemWithIcon(
                          "Domestic Explosion & Earthquake".tr,
                          "1% from total sum insured".tr,
                          Icons.percent,
                          isRed: true,
                        ),
                      ]),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomOutlinedButton(
                  text: "lbl_close".tr,
                  buttonStyle: CustomButtonStyles.outlinePrimary.copyWith(
                    fixedSize: WidgetStateProperty.all<Size>(
                      Size(double.infinity, getVerticalSize(54)),
                    ),
                  ),
                  onTap: () => Get.back(),
                  buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  Widget _buildSectionTitle(String title, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: CustomTextStyles.titleLargeBold.copyWith(color: color),
      ),
    );
  }

  Widget _buildCoverageCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildCoverageItemWithIcon(
    String title,
    String subtitle,
    IconData icon, {
    bool isRed = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
              color: isRed ? Colors.red : theme.colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: CustomTextStyles.titleMediumPrimary.copyWith(
                      color: isRed ? Colors.red : Colors.black87,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: CustomTextStyles.titleMediumSemiBold.copyWith(
                      color: isRed ? Colors.red.shade700 : Colors.black54,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoverageItem(String text, {bool isRed = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: isRed
            ? CustomTextStyles.titleMediumPrimary.copyWith(color: Colors.red)
            : CustomTextStyles.titleMediumPrimary,
      ),
    );
  }

  // void showCustomDialog() {
  //   liabilityCoverage.value = true;
  //   contentCoverage.value = true;
  //   personalLiabilityCoverage.value = true;
  //   fireTheftLiabilityCoverage.value = true;
  //   Get.dialog(
  //     AlertDialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       titlePadding: EdgeInsets.all(15.0),
  //       title: Text(
  //         "lbl_your_coverage".tr,
  //         maxLines: 5,
  //         overflow: TextOverflow.ellipsis,
  //         textAlign: TextAlign.center,
  //         style: CustomTextStyles.titleLargeBold,
  //       ),
  //       content: SizedBox(
  //         height: 500,
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               const Divider(),
  //               Text(
  //                   // "lbl_liability_coverage".tr,
  //                   "Fire & Lightening: Up to total sum issued",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               SizedBox(height: getVerticalSize(10)),
  //               Text(
  //                   // "lbl_content_coverage".tr,
  //                   "Domestic Explosion: Up to total sum issued",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               SizedBox(height: getVerticalSize(10)),
  //               Text(
  //                   // "lbl_personal_liability_coverage".tr,
  //                   "Earthquake: Up to total sum issued",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               SizedBox(height: getVerticalSize(10)),
  //               Text(
  //                   // "lbl_fire_theft_liability_coverage".tr,
  //                   "Storm, Tempest & Flood : Up to total sum issued",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               SizedBox(height: getVerticalSize(10)),
  //               Text(
  //                   // "lbl_fire_theft_liability_coverage".tr,
  //                   "Neighbors Recourse: Up to IQD 7,500,000",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               SizedBox(height: getVerticalSize(10)),
  //               Text(
  //                   // "lbl_fire_theft_liability_coverage".tr,
  //                   "Water damage (bursting of pipes and overﬂowing of water tanks): Up to IQD 7,500,000",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               SizedBox(height: getVerticalSize(10)),
  //               Text(
  //                   // "lbl_fire_theft_liability_coverage".tr,
  //                   "-	Burglary following double forcible entry (within Kurdistan Region only): Up to IQD 7,500,000",
  //                   style: CustomTextStyles.titleMediumPrimary),
  //               Divider()
  //             ],
  //           ),
  //         ),
  //       ),
  //       actions: [
  //         CustomOutlinedButton(
  //           text: "Close",
  //           margin: getMargin(
  //             right: 8,
  //           ),
  //           buttonStyle: CustomButtonStyles.outlinePrimary.copyWith(
  //               fixedSize: WidgetStateProperty.all<Size>(Size(
  //             double.maxFinite,
  //             getVerticalSize(
  //               54,
  //             ),
  //           ))),
  //           onTap: () {
  //             Get.back();
  //           },
  //           buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  double calculatedTotalPremium() {
    double content = reverseFormatAmount(contentValueController.text.isNotEmpty
        ? contentValueController.text
        : '0');
    double construction = reverseFormatAmount(
        constructionValueController.text.isNotEmpty
            ? constructionValueController.text
            : '0');
    double value = ((content + construction) * premiumRate.value) / 1000;
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

  Future<void> homeDetails() async {
    debugPrint("*************** homeDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request(
          'GET', Uri.parse('$baseUrl/home-insurance/data/details'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("homeDetails str = $str");
      if (response.statusCode == 200) {
        HomeInsuranceDetailsModel detailsModel =
            HomeInsuranceDetailsModel.fromJson(str);
        detailsModelData.value = detailsModel;
        if (detailsModel.data != null) {
          premiumRate.value = detailsModel.data!.rate ?? 0;
          isInstallment.value =
              (detailsModel.data!.isInstallment ?? 0) == 1 ? true : false;
          installmentMonth.value = detailsModel.data!.installmentMonth ?? 0;
          minPremium.value =
              double.parse(detailsModel.data!.minimumRule.toString() ?? '0');
          conditions.value = detailsModel.data!.termCondition ?? '';
        }
      } else {
        SnackBarWidget()
            .showSnackBar(Get.context!, 'Failed to get Home Insurance Details');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Submit
  Future<void> submitForm() async {
    debugPrint("*************** home form  ***********");
    final acceptToken = storage.read('token');
    isLoading.value = true;
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/home-insurance-form'));

      request.fields.addAll({
        'name': nameController.text,
        'dob': dateController.text,
        'gender': gender.value,
        'email': emailController.text,
        'phone': phoneController.text,
        'for_own': '1',
        'property_type': propertyType.value,
        'property_floor': propertyFloorController.text,
        'property_house': propertyHouseController.text,
        'property_street': propertyStreetController.text,
        'property_address': propertyAddressController.text,
        'province': province.value,
        'home_type': homeType.value,
        'property_area': propertyAreaController.text,
        'property_block': propertyBlockController.text,
        'property_project': propertyProjectController.text,
        'property_alley': propertyAlleyController.text,
        'property_apartment': propertyApartmentController.text,
        'construction_value':
            reverseFormatAmount(constructionValueController.text).toString(),
        'content_value':
            reverseFormatAmount(contentValueController.text).toString(),
        'liability_coverage': liabilityCoverage.value ? '1' : '0',
        'content_coverage': contentCoverage.value ? '1' : '0',
        'start': startController.text,
        'end': endController.text,
        'total_premium': (totalPremium.value - discountAmount.value).toString(),
        'is_installment': selectInstallment.value ? '1' : '0',
        'installment_month': installmentMonth.value.toString(),
        'installment_per_month': installmentPerMonth.value.toString(),
        'discount_code':
            discountAmount.value > 0 ? couponController.text.trim() : '',
        'discount_amount': discountAmount.value.toString(),
        'personal_liability_coverage':
            personalLiabilityCoverage.value ? '1' : '0',
        'fire_theft_liability_coverage':
            fireTheftLiabilityCoverage.value ? '1' : '0',
      });
      if (propertyOwnerDocumentController.text.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'property_owner_document', propertyOwnerDocument.value));
      }
      if (inventoryListDocumentController.text.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
            'inventory_list_document', inventoryListDocument.value));
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
      debugPrint("str  == $str");
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 201) {
        debugPrint("str  == $str");
        final returnData = HomeInsuranceFromResponse.fromJson(str);

        SnackBarWidget().showSnackBar(
            Get.context!, res.message ?? 'Form Submit Successful');
        // Navigate to the home screen
        Get.toNamed(AppRoutes.paymentMethodScreen,
            arguments: PaymentDataModel(
                amount: returnData.data?.paymentData?[0].amount ?? '0',
                firstName: returnData.data?.data?.name ?? 'User',
                invoiceId: returnData.data?.paymentData?[0].invoice ?? '0',
                lastName: '',
                userpaymentId: returnData.data?.paymentData?[0].id ?? 0));
      } else {
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to submit. Please try again later.');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
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
              '$baseUrl/user/coupon/applied?purchase_amount=$totalPremium&code=${couponController.text.trim()}&type=home'));

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
        SnackBarWidget().showSnackBar(
            Get.context!, res.message ?? 'Coupon Applied Successfully');
        // Navigate to the home screen
      } else {
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to submit. Please try again later.');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
