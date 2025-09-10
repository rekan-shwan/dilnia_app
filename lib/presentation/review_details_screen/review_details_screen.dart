import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/review_details_controller.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({super.key});

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  ReviewDetailsController controller = Get.put(ReviewDetailsController());

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
              backgroundColor: appTheme.whiteA700,
              appBar: CustomAppBar(
                height: getVerticalSize(79),
                leadingWidth: getSize(42),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: false,
                title: AppbarTitle(text: "lbl_details".tr),
              ),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 20, top: 16, right: 20, bottom: 16),
                  child: ListView(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: getPadding(
                                    left: 16, top: 15, right: 16, bottom: 15),
                                decoration: AppDecoration.fill10.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 4),
                                          child: Text(
                                              "msg_bike_and_plan_details".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  theme.textTheme.titleMedium)),
                                      Padding(
                                          padding: getPadding(top: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_bike_number".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray600_1),
                                                Text("lbl_gj87mu4874".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyLarge)
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 21),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_make_model".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray600_1),
                                                Text(
                                                    "msg_hero_honda_splendor"
                                                        .tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyLarge)
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 18),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 1),
                                                    child: Text(
                                                        "msg_registration_year"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: CustomTextStyles
                                                            .bodyLargeGray600_1)),
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 1),
                                                    child: Text("lbl_2021".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 18),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_insured_value".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray600_1),
                                                Text("lbl_123_00".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyLarge)
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 1),
                                                    child: Text(
                                                        "msg_policy_start_date"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: CustomTextStyles
                                                            .bodyLargeGray600_1)),
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 1),
                                                    child: Text(
                                                        "lbl_jan_20_2016".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_selected_plan".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray600_1),
                                                Text("lbl_comprehensive".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyLarge)
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 18),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getPadding(bottom: 1),
                                                    child: Text(
                                                        "lbl_plan_tenture".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: CustomTextStyles
                                                            .bodyLargeGray600_1)),
                                                Padding(
                                                    padding: getPadding(top: 1),
                                                    child: Text("lbl_1_year".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ]))
                                    ])),
                            Padding(
                                padding: getPadding(top: 26),
                                child: Text("msg_bike_owner_details".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleMedium)),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: AppDecoration.fill10.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Padding(
                                padding: getPadding(all: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "lbl_john_abram".tr,
                                      style:
                                          CustomTextStyles.bodyLargeGray600_1,
                                    ),
                                    Text(
                                      "johnabram@gmail.com",
                                      style: theme.textTheme.bodyLarge,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: getPadding(top: 27),
                                child: Text("lbl_premium_breakup".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleMedium)),
                            Container(
                                margin: getMargin(top: 17, bottom: 5),
                                padding: getPadding(
                                    left: 16, top: 17, right: 16, bottom: 17),
                                decoration: AppDecoration.fill10.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 1),
                                                child: Text(
                                                    "lbl_net_premium".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray600_1)),
                                            Padding(
                                                padding: getPadding(bottom: 1),
                                                child: Text("lbl_123_00".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyLarge))
                                          ]),
                                      Padding(
                                          padding: getPadding(top: 18),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("lbl_gst".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray600_1),
                                                Text("lbl_20_002".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyLarge)
                                              ]))
                                    ]))
                          ]),
                    ],
                  )),
              bottomNavigationBar: CustomElevatedButton(
                  text: "lbl_pay_now".tr,
                  margin: getMargin(left: 20, right: 20, bottom: 32),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(54)))),
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                  onTap: () {
                    onTapPaynow();
                  }))),
    );
  }

  onTapDetails1() {
    Get.toNamed(
      AppRoutes.selectAddOnsScreen,
    );
  }

  onTapPaynow() {
    Get.toNamed(
      AppRoutes.paymentMethodScreen,
    );
  }
}
