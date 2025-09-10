import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_elevated_button.dart';
import '../customize_insured_value_screen/customize_insured_value_screen.dart';
import 'controller/details_tab_container_controller.dart';
import 'models/details_tab_container_model.dart';

class DetailsTabContainerScreen extends StatefulWidget {
  const DetailsTabContainerScreen({super.key});

  @override
  State<DetailsTabContainerScreen> createState() =>
      _DetailsTabContainerScreenState();
}

class _DetailsTabContainerScreenState extends State<DetailsTabContainerScreen> {
  DetailsTabContainerController detailsTabContainerController =
      Get.put(DetailsTabContainerController());

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
              body: GetBuilder<DetailsTabContainerController>(
                init: DetailsTabContainerController(),
                builder: (controller) => Stack(
                  children: [
                    ListView(
                      padding: getPadding(bottom: 120),
                      children: [
                        SizedBox(
                            width: double.maxFinite,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: getHorizontalSize(388),
                                      margin: getMargin(
                                          left: 20, top: 16, right: 20),
                                      padding: getPadding(
                                          left: 16,
                                          top: 17,
                                          right: 16,
                                          bottom: 17),
                                      decoration: AppDecoration.fill9.copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder16),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 3),
                                                child: Text(
                                                    "msg_honda_dream_yuga".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme.textTheme
                                                        .titleMedium)),
                                            Padding(
                                                padding: getPadding(top: 7),
                                                child: Text("lbl_new_ncb_0".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyMedium)),
                                            Padding(
                                                padding: getPadding(top: 8),
                                                child: Text("lbl_year_2013".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyMedium)),
                                            Padding(
                                                padding: getPadding(top: 9),
                                                child: Text(
                                                    "lbl_policy_expired".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: theme
                                                        .textTheme.bodyMedium))
                                          ])),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding:
                                              getPadding(left: 20, top: 28),
                                          child: Text(
                                              "msg_select_plan_tenture".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .titleLargeBold_1))),
                                  SizedBox(
                                    height: getVerticalSize(13),
                                  ),
                                  Padding(
                                    padding: getPadding(left: 16, right: 16),
                                    child: Row(
                                      children: [
                                        get_plan_tenture(1, "lbl_1_year".tr),
                                        SizedBox(
                                          width: getHorizontalSize(16),
                                        ),
                                        get_plan_tenture(2, "lbl_2_year".tr),
                                        SizedBox(
                                          width: getHorizontalSize(16),
                                        ),
                                        get_plan_tenture(3, "lbl_3_year".tr),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    padding: getPadding(
                                        left: 20, right: 20, top: 16),
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: controller.getPlan.length,
                                    itemBuilder: (context, index) {
                                      DetailsTabContainerModel data =
                                          controller.getPlan[index];
                                      return GestureDetector(
                                        onTap: () {
                                          controller
                                              .setCurrentSelectedPlan(index);
                                        },
                                        child: Padding(
                                          padding:
                                              getPadding(top: 8, bottom: 8),
                                          child: Container(
                                            decoration: AppDecoration.fill9
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder16),
                                            child: Padding(
                                              padding: getPadding(all: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CustomImageView(
                                                            height: getSize(24),
                                                            width: getSize(24),
                                                            svgPath: controller
                                                                        .currentPlanIndex ==
                                                                    index
                                                                ? ImageConstant
                                                                    .imgRadioselected
                                                                : ImageConstant
                                                                    .imgRadioUnselected,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                getHorizontalSize(
                                                                    8),
                                                          ),
                                                          Text(
                                                            data.title!,
                                                            style: theme
                                                                .textTheme
                                                                .bodyLarge!,
                                                          )
                                                        ],
                                                      ),
                                                      Text(data.price!,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .titleLargeBold_1)
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: getSize(11),
                                                  ),
                                                  ListView.builder(
                                                    itemCount: data
                                                        .planFeatures!.length,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding: getPadding(
                                                            top: 4, bottom: 4),
                                                        child: Row(
                                                          children: [
                                                            CustomImageView(
                                                              height:
                                                                  getSize(24),
                                                              width:
                                                                  getSize(24),
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgDoneIcon,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  getHorizontalSize(
                                                                      8),
                                                            ),
                                                            Text(
                                                              data.planFeatures![
                                                                  index],
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium!,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                          AppRoutes
                                                              .comprehensivePlanScreen,
                                                        );
                                                      },
                                                      child: Padding(
                                                          padding: getPadding(
                                                              top: 10),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          top: 20, left: 20, right: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        getHorizontalSize(32)),
                                                    topRight: Radius.circular(
                                                        getHorizontalSize(
                                                            32)))),
                                            context: context,
                                            builder: (context) {
                                              return CustomizeInsuredValueScreen();
                                            },
                                          );
                                        },
                                        child: Text("msg_idv_insred_value".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .titleLargeBold_1),
                                      )),
                                ])),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: appTheme.whiteA700,
                        child: Padding(
                          padding: getPadding(left: 20, right: 20, bottom: 32),
                          child: CustomElevatedButton(
                              text: "lbl_continue".tr,
                              margin: getMargin(top: 37),
                              buttonStyle: CustomButtonStyles.fillPrimary
                                  .copyWith(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(Size(
                                              double.maxFinite,
                                              getVerticalSize(54)))),
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumWhiteA700,
                              onTap: () {
                                // Get.toNamed(
                                //   AppRoutes.selectAddOnsScreen,
                                Get.toNamed(
                                  AppRoutes.verifyBikeDetailsScreen,
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  onTapDetails() {
    Get.toNamed(
      AppRoutes.bikeInsurenceOneScreen,
    );
  }

  Widget get_plan_tenture(id, title) {
    return GetBuilder<DetailsTabContainerController>(
      init: DetailsTabContainerController(),
      builder: (controller) => Expanded(
          child: GestureDetector(
        onTap: () {
          controller.setCurrentPlan(id);
        },
        child: Container(
          decoration: controller.currentPlan == id
              ? BoxDecoration(
                  color: appTheme.indigo5001,
                  borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                  border: Border.all(
                      color: theme.colorScheme.primary,
                      width: getHorizontalSize(1)))
              : AppDecoration.fill9
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
          child: Padding(
            padding: getPadding(top: 12, bottom: 12),
            child: Center(
                child: Text(
              title,
              style: controller.currentPlan == id
                  ? CustomTextStyles.titleMedium17width400
                  : CustomTextStyles.titleMedium17width400black,
            )),
          ),
        ),
      )),
    );
  }
}
