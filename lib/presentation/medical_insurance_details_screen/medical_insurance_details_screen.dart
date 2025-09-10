// import 'package:flutter/material.dart';
// import 'package:insurance_app/core/app_export.dart';
// import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

// import '../../core/utils/validation_functions.dart';
// import '../../widgets/app_bar/appbar_image.dart';
// import '../../widgets/app_bar/appbar_title.dart';
// import '../payment_method_screen/models/payment_data_model.dart';
// import 'controller/medical_insurance_details_controller.dart';
// import 'models/medical_insurance_form_details_model.dart';

// class MedicalInsuranceDetailsScreen extends StatefulWidget {
//   const MedicalInsuranceDetailsScreen({super.key});

//   @override
//   State<MedicalInsuranceDetailsScreen> createState() =>
//       _MedicalInsuranceDetailsScreenState();
// }

// class _MedicalInsuranceDetailsScreenState
//     extends State<MedicalInsuranceDetailsScreen> {
//   MedicalInsuranceDetailsController controller =
//       Get.put(MedicalInsuranceDetailsController());

//   @override
//   void initState() {
//     setSafeAreaColor();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return WillPopScope(
//       onWillPop: () async {
//         Get.back();
//         return true;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           backgroundColor: appTheme.whiteA700,
//           appBar: CustomAppBar(
//             height: getVerticalSize(79),
//             leadingWidth: getSize(42),
//             leading: Padding(
//               padding: getPadding(right: 16),
//               child: AppbarImage(
//                   height: getSize(24),
//                   width: getSize(24),
//                   svgPath: ImageConstant.imgArrowleft,
//                   // margin: getMargin(left: 16, top: 29, bottom: 26),

//                   onTap: () {
//                     Get.back();
//                   }),
//             ),
//             centerTitle: false,
//             title: AppbarTitle(text: "msg_policies_details".tr),
//             actions: [
//               InkWell(
//                 onTap: () => controller.generateAndDownloadPdf(context),
//                 child: const Icon(
//                   Icons.print,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//           body: SizedBox(
//             width: mediaQueryData.size.width,
//             child: SingleChildScrollView(
//               child: Padding(
//                   padding: getPadding(
//                     left: 20,
//                     right: 20,
//                     bottom: 5,
//                   ),
//                   child: Obx(() {
//                     MedicalInsuranceDetailsData? _tempData =
//                         controller.detailsObj.value.data ?? null;
//                     return _tempData == null
//                         ? const Center(child: CircularProgressIndicator())
//                         : Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               // CustomImageView(
//                               //   imagePath: ImageConstant.imgRectangle393196x388,
//                               //   height: getVerticalSize(
//                               //     196,
//                               //   ),
//                               //   width: getHorizontalSize(
//                               //     388,
//                               //   ),
//                               //   radius: BorderRadius.circular(
//                               //     getHorizontalSize(
//                               //       16,
//                               //     ),
//                               //   ),
//                               // ),
//                               //personal information
//                               Padding(
//                                 padding: getPadding(
//                                   top: 4,
//                                 ),
//                                 child: Text(
//                                   "lbl_personal_info".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),

//                               Container(
//                                 margin: getMargin(
//                                   top: 0,
//                                 ),
//                                 padding: getPadding(
//                                   left: 16,
//                                   top: 15,
//                                   right: 16,
//                                   bottom: 15,
//                                 ),
//                                 decoration: AppDecoration.fill10.copyWith(
//                                   borderRadius:
//                                       BorderRadiusStyle.roundedBorder16,
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_full_name".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.name!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 21,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_dob".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.dob!
//                                                 .format('dd MMM yyyy'),
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 18,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Padding(
//                                             padding: getPadding(
//                                               top: 1,
//                                             ),
//                                             child: Text(
//                                               "lbl_gender".tr,
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: CustomTextStyles
//                                                   .bodyLargeGray600_1,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: getPadding(
//                                               bottom: 1,
//                                             ),
//                                             child: Text(
//                                               _tempData.gender!,
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: theme.textTheme.bodyLarge,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 18,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_email_address".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.email!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 18,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_mobile".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.phone!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               //property details
//                               Padding(
//                                 padding: getPadding(
//                                   top: 26,
//                                 ),
//                                 child: Text(
//                                   "lbl_medical".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               Container(
//                                 margin: getMargin(
//                                   top: 0,
//                                 ),
//                                 padding: getPadding(
//                                   left: 16,
//                                   top: 15,
//                                   right: 16,
//                                   bottom: 15,
//                                 ),
//                                 decoration: AppDecoration.fill10.copyWith(
//                                   borderRadius:
//                                       BorderRadiusStyle.roundedBorder16,
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_coverage_area".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.coverageArea!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 21,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_insurance_plan".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             controller
//                                                 .planList[int.parse((_tempData
//                                                         .medicalInsurancePackage!
//                                                         .plan ??
//                                                     '1')) -
//                                                 1],
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 21,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_age".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData
//                                                 .medicalInsurancePackage!.name!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               //insurance coverage
//                               Padding(
//                                 padding: getPadding(
//                                   top: 26,
//                                 ),
//                                 child: Text(
//                                   "lbl_family_member".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               Container(
//                                   margin: getMargin(
//                                     top: 0,
//                                   ),
//                                   padding: getPadding(
//                                     left: 16,
//                                     top: 15,
//                                     right: 16,
//                                     bottom: 15,
//                                   ),
//                                   decoration: AppDecoration.fill10.copyWith(
//                                     borderRadius:
//                                         BorderRadiusStyle.roundedBorder16,
//                                   ),
//                                   child: ListView.builder(
//                                       itemCount: _tempData.family?.length ?? 0,
//                                       shrinkWrap: true,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: ListTile(
//                                             tileColor: Colors.grey.shade300,
//                                             contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     horizontal: 5),
//                                             // trailing: IconButton(
//                                             //   onPressed: () {
//                                             //     controller.deleteFamily(index);
//                                             //   },
//                                             //   icon: const Icon(
//                                             //     Icons.delete,
//                                             //     color: Colors.red,
//                                             //   ),
//                                             // ),
//                                             leading: Text(
//                                               "${index + 1}",
//                                               style:
//                                                   const TextStyle(fontSize: 18),
//                                             ),
//                                             title: Text(
//                                                 _tempData.family?[index].name ??
//                                                     'Family'),
//                                             subtitle: Row(
//                                               children: [
//                                                 Text(_tempData.family?[index]
//                                                         .relation ??
//                                                     'Family'),
//                                                 const SizedBox(width: 15),
//                                                 Text(
//                                                     "Premium: ${formatCurrency(_tempData.family?[index].premium)}"),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       })),

//                               Padding(
//                                 padding: getPadding(
//                                   top: 28,
//                                 ),
//                                 child: Text(
//                                   "lbl_payment_details".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: getVerticalSize(16),
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 padding: getPadding(
//                                     top: 18, bottom: 18, left: 16, right: 16),
//                                 decoration: AppDecoration.fill10.copyWith(
//                                   borderRadius:
//                                       BorderRadiusStyle.roundedBorder16,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "lbl_total_premium".tr,
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.left,
//                                       style:
//                                           CustomTextStyles.bodyLargeGray600_1,
//                                     ),
//                                     Text(
//                                       formatCurrency(
//                                           _tempData.totalPremium ?? 0),
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.left,
//                                       style: theme.textTheme.bodyLarge,
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               ListView.builder(
//                                   itemCount: _tempData.userPayment?.length ?? 0,
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, index) {
//                                     return Container(
//                                       width: double.infinity,
//                                       padding: EdgeInsets.all(10.0),
//                                       decoration: AppDecoration.fill10.copyWith(
//                                         borderRadius:
//                                             BorderRadiusStyle.roundedBorder16,
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 "${"lbl_installment".tr} ${index + 1} :  ${formatCurrency(_tempData.userPayment![index].amount)}",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 textAlign: TextAlign.left,
//                                                 style: CustomTextStyles
//                                                     .bodyLargeGray600_1,
//                                               ),
//                                               TextButton(
//                                                 onPressed: () {
//                                                   if (_tempData
//                                                           .userPayment![index]
//                                                           .isPaid !=
//                                                       1) {
//                                                     Get.toNamed(
//                                                         AppRoutes
//                                                             .paymentMethodScreen,
//                                                         arguments: PaymentDataModel(
//                                                             amount: _tempData
//                                                                     .userPayment![
//                                                                         index]
//                                                                     .amount
//                                                                     .toString() ??
//                                                                 '0',
//                                                             firstName: _tempData
//                                                                     .name ??
//                                                                 'User',
//                                                             invoiceId: _tempData
//                                                                     .userPayment![
//                                                                         index]
//                                                                     .invoice ??
//                                                                 '0',
//                                                             lastName: '',
//                                                             userpaymentId: _tempData
//                                                                     .userPayment![
//                                                                         index]
//                                                                     .id ??
//                                                                 0));
//                                                   }
//                                                 },
//                                                 child: Container(
//                                                   padding: EdgeInsets.all(5.0),
//                                                   decoration: BoxDecoration(
//                                                       color: _tempData
//                                                                   .userPayment![
//                                                                       index]
//                                                                   .isPaid ==
//                                                               1
//                                                           ? Colors.blueAccent
//                                                           : Colors.redAccent,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8.0)),
//                                                   child: Text(
//                                                     _tempData
//                                                                 .userPayment![
//                                                                     index]
//                                                                 .isPaid ==
//                                                             1
//                                                         ? "lbl_paid".tr
//                                                         : "lbl_pay_now".tr,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.left,
//                                                     style: theme
//                                                         .textTheme.bodyLarge!
//                                                         .copyWith(
//                                                             color:
//                                                                 Colors.white),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 "${"lbl_payment_last_day".tr} : ${_tempData.userPayment![index].expireDate!.format("dd MMM yyyy")}",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 textAlign: TextAlign.left,
//                                                 style: CustomTextStyles
//                                                     .bodyLargeGray600_1,
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     );
//                                   }),
//                               SizedBox(
//                                 height: getVerticalSize(32),
//                               ),
//                             ],
//                           );
//                   })),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../payment_method_screen/models/payment_data_model.dart';
import 'controller/medical_insurance_details_controller.dart';
import 'models/medical_insurance_form_details_model.dart';

class MedicalInsuranceDetailsScreen extends StatefulWidget {
  const MedicalInsuranceDetailsScreen({super.key});

  @override
  State<MedicalInsuranceDetailsScreen> createState() =>
      _MedicalInsuranceDetailsScreenState();
}

class _MedicalInsuranceDetailsScreenState
    extends State<MedicalInsuranceDetailsScreen> {
  MedicalInsuranceDetailsController controller =
      Get.put(MedicalInsuranceDetailsController());

  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: CustomAppBar(
            height: getVerticalSize(79),
            leadingWidth: getSize(42),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: 20),
            ),
            centerTitle: false,
            title: AppbarTitle(text: "msg_policies_details".tr),
            actions: [
              Container(
                margin: getPadding(right: 16),
                child: InkWell(
                  onTap: () => controller.generateAndDownloadPdf(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.print,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(left: 20, right: 20, bottom: 32),
                child: Obx(() {
                  MedicalInsuranceDetailsData? _tempData =
                      controller.detailsObj.value.data ?? null;
                  return _tempData == null
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(64.0),
                            child: CircularProgressIndicator(
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Hero section with policy status
                            Container(
                              width: double.infinity,
                              margin: getMargin(top: 16, bottom: 24),
                              padding: getPadding(all: 24),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF3B82F6),
                                    Color(0xFF1D4ED8)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF3B82F6)
                                        .withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.medical_services,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Medical Insurance Policy",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: getFontSize(20),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "${_tempData.coverageArea} Coverage",
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                fontSize: getFontSize(16),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    formatCurrency(_tempData.totalPremium ?? 0),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getFontSize(28),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "Total Premium",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: getFontSize(14),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Personal Information Section
                            _buildSectionHeader(
                                "lbl_personal_info".tr, Icons.person_outline),
                            _buildInfoCard([
                              _buildInfoRow(
                                  "lbl_full_name".tr, _tempData.name!),
                              _buildInfoRow("lbl_dob".tr,
                                  _tempData.dob!.format('dd MMM yyyy')),
                              _buildInfoRow("lbl_gender".tr, _tempData.gender!),
                              _buildInfoRow(
                                  "lbl_email_address".tr, _tempData.email!,
                                  isFlexible: true),
                              _buildInfoRow("lbl_mobile".tr, _tempData.phone!),
                            ]),

                            // Medical Insurance Details Section
                            _buildSectionHeader("lbl_medical".tr,
                                Icons.medical_services_outlined),
                            _buildInfoCard([
                              _buildInfoRow("lbl_coverage_area".tr,
                                  _tempData.coverageArea!),
                              _buildInfoRow(
                                  "lbl_insurance_plan".tr,
                                  controller.planList[int.parse((_tempData
                                              .medicalInsurancePackage!.plan ??
                                          '1')) -
                                      1]),
                              _buildInfoRow("lbl_age".tr,
                                  _tempData.medicalInsurancePackage!.name!),
                            ]),

                            // Family Members Section
                            if (_tempData.family != null &&
                                _tempData.family!.isNotEmpty) ...[
                              _buildSectionHeader("lbl_family_member".tr,
                                  Icons.family_restroom_outlined),
                              Container(
                                width: double.infinity,
                                padding: getPadding(all: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: List.generate(
                                      _tempData.family!.length, (index) {
                                    final member = _tempData.family![index];
                                    return Container(
                                      margin: getMargin(
                                          bottom: index ==
                                                  _tempData.family!.length - 1
                                              ? 0
                                              : 12),
                                      padding: getPadding(all: 16),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8FAFC),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xFF3B82F6)
                                              .withOpacity(0.1),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF3B82F6)
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF3B82F6),
                                                  fontSize: getFontSize(16),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  member.name ??
                                                      'Family Member',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF1F2937),
                                                    fontSize: getFontSize(16),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Text(
                                                      member.relation ??
                                                          'Family',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF6B7280),
                                                        fontSize:
                                                            getFontSize(14),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Text(
                                                      "Premium: ${formatCurrency(member.premium)}",
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFF059669),
                                                        fontSize:
                                                            getFontSize(14),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],

                            // Payment Details Section
                            _buildSectionHeader("lbl_payment_details".tr,
                                Icons.payment_outlined),

                            // Total Premium Summary
                            Container(
                              width: double.infinity,
                              margin: getMargin(bottom: 16),
                              padding: getPadding(all: 20),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF059669),
                                    Color(0xFF047857)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF059669)
                                        .withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "lbl_total_premium".tr,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: getFontSize(16),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    formatCurrency(_tempData.totalPremium ?? 0),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getFontSize(20),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Payment installments
                            if (_tempData.userPayment != null &&
                                _tempData.userPayment!.isNotEmpty)
                              ...List.generate(_tempData.userPayment!.length,
                                  (index) {
                                final payment = _tempData.userPayment![index];
                                return Container(
                                  width: double.infinity,
                                  margin: getMargin(bottom: 12),
                                  padding: getPadding(all: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: payment.isPaid == 1
                                                  ? const Color(0xFF10B981)
                                                      .withOpacity(0.1)
                                                  : const Color(0xFFF59E0B)
                                                      .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Icon(
                                              payment.isPaid == 1
                                                  ? Icons.check_circle_outline
                                                  : Icons.schedule,
                                              color: payment.isPaid == 1
                                                  ? const Color(0xFF10B981)
                                                  : const Color(0xFFF59E0B),
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${"lbl_installment".tr} ${index + 1}",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF1F2937),
                                                    fontSize: getFontSize(16),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "${"lbl_payment_last_day".tr}: ${payment.expireDate!.format("dd MMM yyyy")}",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF6B7280),
                                                    fontSize: getFontSize(14),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                formatCurrency(payment.amount),
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF1F2937),
                                                  fontSize: getFontSize(18),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              GestureDetector(
                                                onTap: () {
                                                  if (payment.isPaid != 1) {
                                                    Get.toNamed(
                                                      AppRoutes
                                                          .paymentMethodScreen,
                                                      arguments:
                                                          PaymentDataModel(
                                                        amount: payment.amount
                                                                .toString() ??
                                                            '0',
                                                        firstName:
                                                            _tempData.name ??
                                                                'User',
                                                        invoiceId:
                                                            payment.invoice ??
                                                                '0',
                                                        lastName: '',
                                                        userpaymentId:
                                                            payment.id ?? 0,
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: payment.isPaid == 1
                                                        ? const Color(
                                                            0xFF10B981)
                                                        : const Color(
                                                            0xFF3B82F6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Text(
                                                    payment.isPaid == 1
                                                        ? "lbl_paid".tr
                                                        : "lbl_pay_now".tr,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: getFontSize(12),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          ],
                        );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: getPadding(top: 32, bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF3B82F6),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF1F2937),
              fontSize: getFontSize(20),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: getPadding(all: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isFlexible = false}) {
    return Padding(
      padding: getPadding(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                color: const Color(0xFF6B7280),
                fontSize: getFontSize(14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: isFlexible ? 4 : 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFF1F2937),
                fontSize: getFontSize(14),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
