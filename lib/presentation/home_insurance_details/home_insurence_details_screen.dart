// import 'package:flutter/material.dart';
// import 'package:insurance_app/core/app_export.dart';
// import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

// import '../../core/utils/validation_functions.dart';
// import '../../widgets/app_bar/appbar_image.dart';
// import '../../widgets/app_bar/appbar_title.dart';
// import '../payment_method_screen/models/payment_data_model.dart';
// import 'controller/home_insurance_details_controller.dart';
// import 'models/home_insurance_form_details_model.dart';

// class HomeInsuranceScreen extends StatefulWidget {
//   const HomeInsuranceScreen({super.key});

//   @override
//   State<HomeInsuranceScreen> createState() => _HomeInsuranceScreenState();
// }

// class _HomeInsuranceScreenState extends State<HomeInsuranceScreen> {
//   HomeInsuranceDetailsController controller =
//       Get.put(HomeInsuranceDetailsController());

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
//             leading: IconButton(
//                 onPressed: () => Get.back(),
//                 icon: const Icon(Icons.arrow_back_ios,
//                     color: Colors.black, size: 20)),
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
//                     HomeInsuranceDetailsData? _tempData =
//                         controller.detailsObj.value.data ?? null;
//                     return _tempData == null
//                         ? const Center(child: CircularProgressIndicator())
//                         : Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
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
//                                           SizedBox(
//                                             width: 150,
//                                             child: Text(
//                                               _tempData.email!,
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
//                                   "lbl_property_info".tr,
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
//                                             "lbl_province".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.province!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_home_type".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.homeType!,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     _tempData.homeType == "House"
//                                         ? Column(
//                                             children: [
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_area".tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData.propertyArea!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_block".tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData.propertyBlock!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_alley".tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData.propertyAlley!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_house".tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData.propertyHouse!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         : const SizedBox(),
//                                     _tempData.homeType == "Apartment"
//                                         ? Column(
//                                             children: [
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_project".tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData
//                                                           .propertyProject!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_building"
//                                                           .tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData.propertyHouse!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_floor".tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData.propertyFloor!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: getPadding(
//                                                   top: 19,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       "lbl_property_apartment"
//                                                           .tr,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: CustomTextStyles
//                                                           .bodyLargeGray600_1,
//                                                     ),
//                                                     Text(
//                                                       _tempData
//                                                           .propertyApartment!,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.left,
//                                                       style: theme
//                                                           .textTheme.bodyLarge,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         : const SizedBox(),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_property_type".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.propertyType!,
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
//                                             "lbl_property_address".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.propertyAddress!,
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
//                                               "lbl_construction_value".tr,
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
//                                               formatCurrency(
//                                                   _tempData.constructionValue!),
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
//                                             "lbl_content_value".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             formatCurrency(
//                                                 _tempData.contentValue!),
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
//                                   "lbl_insurance_coverage".tr,
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
//                                             "lbl_liability_coverage".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.liabilityCoverage! == 1
//                                                 ? 'lbl_yes'.tr
//                                                 : 'lbl_no'.tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_content_coverage".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.contentCoverage! == 1
//                                                 ? 'lbl_yes'.tr
//                                                 : 'lbl_no'.tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_personal_liability_coverage"
//                                                 .tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.personalLiabilityCoverage! ==
//                                                     1
//                                                 ? 'lbl_yes'.tr
//                                                 : 'lbl_no'.tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "lbl_fire_theft_liability_coverage"
//                                                 .tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.fireTheftLiabilityCoverage! ==
//                                                     1
//                                                 ? 'lbl_yes'.tr
//                                                 : 'lbl_no'.tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: theme.textTheme.bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: getPadding(
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "msg_policy_start_date".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.start!
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
//                                         top: 19,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "msg_policy_end_date".tr,
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: CustomTextStyles
//                                                 .bodyLargeGray600_1,
//                                           ),
//                                           Text(
//                                             _tempData.end!
//                                                 .format('dd MMM yyyy'),
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

//                               Padding(
//                                 padding: getPadding(
//                                   top: 28,
//                                 ),
//                                 child: Text(
//                                   'lbl_Payment_details'.tr,
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
//                                       formatCurrency(_tempData.totalPremium),
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.left,
//                                       style: theme.textTheme.bodyLarge,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
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
//                                                   padding:
//                                                       const EdgeInsets.all(5.0),
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
import 'controller/home_insurance_details_controller.dart';
import 'models/home_insurance_form_details_model.dart';

class HomeInsuranceScreen extends StatefulWidget {
  const HomeInsuranceScreen({super.key});

  @override
  State<HomeInsuranceScreen> createState() => _HomeInsuranceScreenState();
}

class _HomeInsuranceScreenState extends State<HomeInsuranceScreen> {
  HomeInsuranceDetailsController controller =
      Get.put(HomeInsuranceDetailsController());

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
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.print,
                      color: Color(0xFF10B981),
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
                  HomeInsuranceDetailsData? _tempData =
                      controller.detailsObj.value.data ?? null;
                  return _tempData == null
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(64.0),
                            child: CircularProgressIndicator(
                              color: Color(0xFF10B981),
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
                                    Color(0xFF10B981),
                                    Color(0xFF059669)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF10B981)
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
                                          Icons.home,
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
                                              "Home Insurance Policy",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: getFontSize(20),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "${_tempData.homeType} in ${_tempData.province}",
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
                                    formatCurrency(_tempData.totalPremium),
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

                            // Property Information Section
                            _buildSectionHeader("lbl_property_info".tr,
                                Icons.location_city_outlined),
                            _buildInfoCard([
                              _buildInfoRow(
                                  "lbl_province".tr, _tempData.province!),
                              _buildInfoRow(
                                  "lbl_home_type".tr, _tempData.homeType!),

                              // Conditional property details based on home type
                              if (_tempData.homeType == "House") ...[
                                _buildInfoRow("lbl_property_area".tr,
                                    _tempData.propertyArea!),
                                _buildInfoRow("lbl_property_block".tr,
                                    _tempData.propertyBlock!),
                                _buildInfoRow("lbl_property_alley".tr,
                                    _tempData.propertyAlley!),
                                _buildInfoRow("lbl_property_house".tr,
                                    _tempData.propertyHouse!),
                              ],

                              if (_tempData.homeType == "Apartment") ...[
                                _buildInfoRow("lbl_property_project".tr,
                                    _tempData.propertyProject!),
                                _buildInfoRow("lbl_property_building".tr,
                                    _tempData.propertyHouse!),
                                _buildInfoRow("lbl_property_floor".tr,
                                    _tempData.propertyFloor!),
                                _buildInfoRow("lbl_property_apartment".tr,
                                    _tempData.propertyApartment!),
                              ],

                              _buildInfoRow("lbl_property_type".tr,
                                  _tempData.propertyType!),
                              _buildInfoRow("lbl_property_address".tr,
                                  _tempData.propertyAddress!,
                                  isFlexible: true),
                              _buildInfoRow("lbl_construction_value".tr,
                                  formatCurrency(_tempData.constructionValue!)),
                              _buildInfoRow("lbl_content_value".tr,
                                  formatCurrency(_tempData.contentValue!)),
                            ]),

                            // Coverage Information Section
                            _buildSectionHeader("lbl_insurance_coverage".tr,
                                Icons.security_outlined),
                            _buildCoverageCard(_tempData),

                            // Payment Details Section
                            _buildSectionHeader("lbl_payment_details".tr,
                                Icons.payment_outlined),

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
              color: const Color(0xFF10B981).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF10B981),
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

  Widget _buildCoverageCard(HomeInsuranceDetailsData data) {
    final coverages = [
      {
        'title': "lbl_liability_coverage".tr,
        'value': data.liabilityCoverage! == 1,
        'icon': Icons.security,
      },
      {
        'title': "lbl_content_coverage".tr,
        'value': data.contentCoverage! == 1,
        'icon': Icons.inventory_2_outlined,
      },
      {
        'title': "lbl_personal_liability_coverage".tr,
        'value': data.personalLiabilityCoverage! == 1,
        'icon': Icons.person_pin_circle_outlined,
      },
      {
        'title': "lbl_fire_theft_liability_coverage".tr,
        'value': data.fireTheftLiabilityCoverage! == 1,
        'icon': Icons.local_fire_department_outlined,
      },
    ];

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
        children: [
          // Coverage items
          ...coverages.map((coverage) => Container(
                margin: getMargin(bottom: 16),
                padding: getPadding(all: 12),
                decoration: BoxDecoration(
                  color: coverage['value'] as bool
                      ? const Color(0xFF10B981).withOpacity(0.1)
                      : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: coverage['value'] as bool
                        ? const Color(0xFF10B981).withOpacity(0.3)
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: coverage['value'] as bool
                            ? const Color(0xFF10B981)
                            : const Color(0xFF9CA3AF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        coverage['icon'] as IconData,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        coverage['title'] as String,
                        style: TextStyle(
                          color: const Color(0xFF1F2937),
                          fontSize: getFontSize(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: coverage['value'] as bool
                            ? const Color(0xFF10B981)
                            : const Color(0xFFF87171),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        coverage['value'] as bool ? 'lbl_yes'.tr : 'lbl_no'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getFontSize(12),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )),

          // Policy dates
          Container(
            padding: getPadding(all: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildDateRow("msg_policy_start_date".tr,
                    data.start!.format('dd MMM yyyy')),
                const SizedBox(height: 12),
                _buildDateRow(
                    "msg_policy_end_date".tr, data.end!.format('dd MMM yyyy')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF6B7280),
            fontSize: getFontSize(14),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF1F2937),
            fontSize: getFontSize(14),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
