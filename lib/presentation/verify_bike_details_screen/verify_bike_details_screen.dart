import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/current_policy_status_screen/current_policy_status_screen.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/verify_bike_details_controller.dart';

class VerifyBikeDetailsScreen extends StatefulWidget {
  const VerifyBikeDetailsScreen({super.key});

  @override
  State<VerifyBikeDetailsScreen> createState() =>
      _VerifyBikeDetailsScreenState();
}

class _VerifyBikeDetailsScreenState extends State<VerifyBikeDetailsScreen> {
  VerifyBikeDetailsController verifyBikeDetailsController =
      Get.put(VerifyBikeDetailsController());

  String currentType = "Not expired";

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
      child: ColorfulSafeArea(
          color: appTheme.whiteA700,
          child: Scaffold(
              backgroundColor: appTheme.whiteA700,
              appBar: CustomAppBar(
                height: getVerticalSize(79),
                leadingWidth: getSize(42),
                leading: Padding(
                  padding: getPadding(right: 16),
                  child: AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgArrowleft,
                      // margin: getMargin(left: 16, top: 29, bottom: 26),
                      onTap: () {
                        Get.back();
                      }),
                ),
                centerTitle: false,
                title: AppbarTitle(text: "msg_verify_bike_details".tr),
              ),
              body: GetBuilder<VerifyBikeDetailsController>(
                init: VerifyBikeDetailsController(),
                builder: (controller) => Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 20, top: 24, right: 20, bottom: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                              onTap: () {
                                Get.toNamed(AppRoutes.chooseBikeModelScreen);
                              },
                              controller: controller.modelController,
                              suffixConstraints: BoxConstraints(
                                  minHeight: getSize(24),
                                  maxHeight: getSize(24)),
                              suffix: Padding(
                                padding: getPadding(right: 16),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowright,
                                ),
                              ),
                              margin: getMargin(top: 22),
                              contentPadding: getPadding(
                                  left: 16, top: 17, right: 16, bottom: 17),
                              hintText: "msg_select_make_model".tr,
                              hintStyle: CustomTextStyles.bodyLargeGray600,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.none,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              },
                              filled: true,
                              fillColor: appTheme.gray50),
                          CustomTextFormField(
                              onTap: () {
                                // BottomPicker.range(
                                //
                                //   title: "lbl_select_year".tr,
                                //   displaySubmitButton: false,
                                //
                                //   dateOrder: DatePickerDateOrder.dmy,
                                //   pickerTextStyle: TextStyle(
                                //     color: Colors.blue,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 12,
                                //   ),
                                //
                                //   displayButtonIcon: true,
                                //   titleStyle: CustomTextStyles
                                //       .bodyLargeBlack900_2,
                                //   onChange: (index) {
                                //     print(index);
                                //   },
                                //   onSubmit: (index) {
                                //     print(index);
                                //   },
                                //   bottomPickerTheme: BottomPickerTheme.plumPlate,
                                // ).show(context);
                                showModalBottomSheet(
                                  isDismissible: false,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              getHorizontalSize(32)),
                                          topRight: Radius.circular(
                                              getHorizontalSize(32)))),
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            left: 20,
                                            right: 20,
                                            top: 24,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "lbl_select_year".tr,
                                                style: CustomTextStyles
                                                    .titleLargeBold_1,
                                              ),
                                              CustomImageView(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  svgPath:
                                                      ImageConstant.imgClose)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 180,
                                          // Adjust the height as needed
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: ListView.builder(
                                              itemCount: 50,
                                              // Number of years to display
                                              itemBuilder: (context, index) {
                                                final year =
                                                    DateTime.now().year + index;
                                                return GetBuilder<
                                                    VerifyBikeDetailsController>(
                                                  init:
                                                      VerifyBikeDetailsController(),
                                                  builder: (controller2) =>
                                                      Padding(
                                                    padding: getPadding(
                                                        top: 4, bottom: 4),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        controller2
                                                            .setCurrentYearIndex(
                                                                index, year);
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                            year.toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: controller2
                                                                        .currentYearIndex ==
                                                                    index
                                                                ? theme
                                                                    .textTheme
                                                                    .titleMedium
                                                                : CustomTextStyles
                                                                    .bodyLargeBlack900_2),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                              top: 24,
                                              left: 20,
                                              right: 20,
                                              bottom: 32),
                                          child: CustomElevatedButton(
                                              text: "Ok",
                                              buttonStyle: CustomButtonStyles
                                                  .fillPrimary
                                                  .copyWith(
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all<Size>(Size(
                                                                  double
                                                                      .maxFinite,
                                                                  getVerticalSize(
                                                                      54)))),
                                              buttonTextStyle: CustomTextStyles
                                                  .titleMediumWhiteA700,
                                              onTap: () {
                                                Get.back();
                                              }),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              controller: controller.dateController,
                              suffixConstraints: BoxConstraints(
                                  minHeight: getSize(24),
                                  maxHeight: getSize(24)),
                              suffix: Padding(
                                padding: getPadding(right: 16),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgCalendreIcon,
                                ),
                              ),
                              margin: getMargin(top: 22),
                              contentPadding: getPadding(
                                  left: 16, top: 17, right: 16, bottom: 17),
                              hintText: "msg_new_policy_start".tr,
                              hintStyle: CustomTextStyles.bodyLargeGray600,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.none,
                              validator: (value) {
                                if (!isNumeric(value)) {
                                  return "Please enter valid number";
                                }
                                return null;
                              },
                              filled: true,
                              fillColor: appTheme.gray50),
                          SizedBox(
                            height: getVerticalSize(16),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            getHorizontalSize(32)),
                                        topRight: Radius.circular(
                                            getHorizontalSize(32)))),
                                context: context,
                                builder: (context) {
                                  return CurrentPolicyStatusScreen();
                                },
                              );
                            },
                            child: Container(
                              decoration: AppDecoration.fill9.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                              child: Padding(
                                padding: getPadding(
                                    left: 16, right: 16, top: 15, bottom: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      verifyBikeDetailsController
                                          .currentPolicyStatus,
                                      style: CustomTextStyles.bodyLargeBlack,
                                    ),
                                    CustomImageView(
                                      height: getSize(24),
                                      width: getSize(24),
                                      svgPath: ImageConstant.imgArrowdown,
                                    ),
                                    // DropdownButton<String>(
                                    //   icon: CustomImageView(
                                    //     height: getSize(24),
                                    //     width: getSize(24),
                                    //     svgPath: ImageConstant.imgArrowdown,
                                    //   ),
                                    //   items: <String>[
                                    //     'expired',
                                    //     'Not expired',
                                    //   ].map((String value) {
                                    //     return DropdownMenuItem<String>(
                                    //       value: value,
                                    //       child: Text(
                                    //         value,
                                    //         style:
                                    //             CustomTextStyles.bodyLargeGray600,
                                    //       ),
                                    //     );
                                    //   }).toList(),
                                    //   underline: SizedBox(),
                                    //   onChanged: (value) {
                                    //     setState(() {
                                    //       currentType = value!;
                                    //     });
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomElevatedButton(
                              onTap: () {
                                Get.toNamed(AppRoutes.selectAddOnsScreen);
                              },
                              text: "lbl_view_plans".tr,
                              margin: getMargin(top: 58, bottom: 5),
                              buttonStyle: CustomButtonStyles.fillPrimary
                                  .copyWith(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(Size(
                                              double.maxFinite,
                                              getVerticalSize(54)))),
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumWhiteA700)
                        ])),
              ))),
    );
  }

  onTapVerifybike() {
    Get.toNamed(
      AppRoutes.detailsTabContainerScreen,
    );
  }

  onTapSelectmake() {
    Get.toNamed(
      AppRoutes.chooseBikeModelScreen,
    );
  }

  onTaptf() {
    Get.toNamed(
      AppRoutes.selectYearPopupScreen,
    );
  }

  onTapNotexpired() {
    Get.toNamed(
      AppRoutes.currentPolicyStatusScreen,
    );
  }
}
