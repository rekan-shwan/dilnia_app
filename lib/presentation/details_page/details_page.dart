import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_checkbox_button.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_radio_button.dart';

import 'controller/details_controller.dart';




class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
 DetailsController controller = Get.put(DetailsController());
 @override
 void initState() {
  setSafeAreaColor();
  super.initState();
 }
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return  WillPopScope(
   onWillPop: () async {
    Get.back();
    return true;
   },
   child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Padding(
                             padding: getPadding(left: 20, top: 24, right: 20),
                             child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                  Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: EdgeInsets.all(0),
                                      color: appTheme.gray50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadiusStyle.roundedBorder16),
                                      child: Container(
                                          height: getVerticalSize(161),
                                          width: getHorizontalSize(388),
                                          padding: getPadding(all: 16),
                                          decoration: AppDecoration.fill9
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16),
                                          child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                               Align(
                                                   alignment: Alignment.topRight,
                                                   child: Padding(
                                                       padding:
                                                       getPadding(top: 2),
                                                       child: Text(
                                                           "lbl_123_00".tr,
                                                           overflow: TextOverflow
                                                               .ellipsis,
                                                           textAlign:
                                                           TextAlign.left,
                                                           style: CustomTextStyles
                                                               .titleLargeBold_1))),
                                               Align(
                                                   alignment:
                                                   Alignment.centerLeft,
                                                   child: Column(
                                                       mainAxisSize:
                                                       MainAxisSize.min,
                                                       crossAxisAlignment:
                                                       CrossAxisAlignment
                                                           .start,
                                                       mainAxisAlignment:
                                                       MainAxisAlignment
                                                           .start,
                                                       children: [
                                                        Obx(() =>
                                                            CustomRadioButton(
                                                                text:
                                                                "msg_comprehensive_plan"
                                                                    .tr,
                                                                value:
                                                                "msg_comprehensive_plan"
                                                                    .tr,
                                                                groupValue:
                                                                controller
                                                                    .radioGroup
                                                                    .value,
                                                                textStyle: theme
                                                                    .textTheme
                                                                    .bodyLarge!,
                                                                onChange:
                                                                    (value) {
                                                                 controller
                                                                     .radioGroup
                                                                     .value = value;
                                                                })),
                                                        Obx(() =>
                                                            CustomCheckboxButton(
                                                                text:
                                                                "msg_coveres_demages"
                                                                    .tr,
                                                                value: controller
                                                                    .isCheckbox
                                                                    .value,
                                                                margin: getMargin(
                                                                    top: 15),
                                                                padding:
                                                                getPadding(
                                                                    top: 2,
                                                                    bottom:
                                                                    2),
                                                                textStyle: theme
                                                                    .textTheme
                                                                    .bodyMedium!,
                                                                onChange:
                                                                    (value) {
                                                                 controller
                                                                     .isCheckbox
                                                                     .value = value;
                                                                })),
                                                        Obx(() =>
                                                            CustomCheckboxButton(
                                                                text:
                                                                "msg_coveres_demages2"
                                                                    .tr,
                                                                value: controller
                                                                    .isCheckbox1
                                                                    .value,
                                                                margin:
                                                                getMargin(
                                                                    top: 8),
                                                                padding:
                                                                getPadding(
                                                                    top: 2,
                                                                    bottom:
                                                                    2),
                                                                textStyle: theme
                                                                    .textTheme
                                                                    .bodyMedium!,
                                                                onChange:
                                                                    (value) {
                                                                 controller
                                                                     .isCheckbox1
                                                                     .value = value;
                                                                })),
                                                        GestureDetector(
                                                            onTap: () {
                                                             onTapTxtSeebenefits();
                                                            },
                                                            child: Padding(
                                                                padding:
                                                                getPadding(
                                                                    top:
                                                                    10),
                                                                child: Text(
                                                                    "lbl_see_benefits"
                                                                        .tr,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                    style: CustomTextStyles
                                                                        .bodyLargePrimary)))
                                                       ]))
                                              ]))),
                                  Padding(
                                      padding: getPadding(top: 16),
                                      child: Obx(() => CustomRadioButton(
                                          value: "",
                                          groupValue:
                                          controller.radioGroup1.value,
                                          margin: getMargin(top: 16),
                                          onChange: (value) {
                                           controller.radioGroup1.value = value;
                                          }))),
                                  Padding(
                                      padding: getPadding(top: 28),
                                      child: Text("msg_idv_insred_value".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                          CustomTextStyles.titleLargeBold_1)),
                                  CustomElevatedButton(
                                      text: "lbl_continue".tr,
                                      margin: getMargin(top: 38),
                                      buttonStyle: CustomButtonStyles.fillPrimary
                                          .copyWith(
                                          fixedSize:
                                          MaterialStateProperty.all<Size>(
                                              Size(double.maxFinite,
                                                  getVerticalSize(54)))),
                                      buttonTextStyle:
                                      CustomTextStyles.titleMediumWhiteA700,
                                      onTap: () {
                                       onTapContinue();
                                      })
                                 ]))
                        ]))))),
  );
 }

 onTapTxtSeebenefits() {
  Get.toNamed(
   AppRoutes.comprehensivePlanScreen,
  );
 }

 onTapContinue() {
  Get.toNamed(
   AppRoutes.selectAddOnsScreen,
  );
 }
}










