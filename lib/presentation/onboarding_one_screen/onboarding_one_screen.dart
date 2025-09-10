import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import 'controller/onboarding_one_controller.dart';
import 'models/onboarding_one_model.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({super.key});

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  OnboardingOneController onboardingOneController =
      Get.put(OnboardingOneController());

  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return PopScope(
      onPopInvokedWithResult: (k, l) async {
        closeApp();
        //return k;
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: GetBuilder<OnboardingOneController>(
          init: OnboardingOneController(),
          builder: (controller) => Stack(
            children: [
              PageView.builder(
                controller: controller.pageControlelr,
                itemCount: controller.onboardingData.length,
                onPageChanged: (value) {
                  controller.setCurrentPage(value);
                },
                itemBuilder: (context, index) {
                  OnboardingOneModel data = controller.onboardingData[index];
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(data.image!), fit: BoxFit.fill)),
                    child: Padding(
                      padding: getPadding(bottom: 182),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: getPadding(top: 16),
                              child: Text(data.title!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.displaySmall)),
                          Container(
                              width: getHorizontalSize(388),
                              margin: getMargin(left: 20, top: 16, right: 20),
                              child: Text(data.subTitle!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyLarge)),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: getPadding(left: 20, right: 20, top: 16, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.currentPage ==
                            controller.onboardingData.length - 1
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  PrefUtils.setIsIntro(false);
                                  onTapTxtSkip();
                                },
                                child: Text("lbl_skip".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: controller.currentPage == 1
                                        ? CustomTextStyles.skipTextWhiteA700
                                        : theme.textTheme.bodyLarge))),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.onboardingData.length, (index) {
                              return AnimatedContainer(
                                margin: getMargin(left: 4, right: 4),
                                duration: const Duration(milliseconds: 300),
                                height: getSize(8),
                                width: getSize(8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (index == controller.currentPage)
                                        ? appTheme.buttonColor
                                        : appTheme.buttonColor
                                            .withOpacity(0.14)),
                              );
                            })),
                        SizedBox(
                          height: getVerticalSize(48),
                        ),
                        CustomElevatedButton(
                            text: controller.currentPage ==
                                    controller.onboardingData.length - 1
                                ? "Get started"
                                : "lbl_next".tr,
                            buttonStyle: CustomButtonStyles.fillPrimary
                                .copyWith(
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        Size(double.maxFinite,
                                            getVerticalSize(54)))),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                            onTap: controller.currentPage ==
                                    controller.onboardingData.length - 1
                                ? () {
                                    PrefUtils.setIsIntro(false);
                                    Get.toNamed(
                                      AppRoutes.loginScreen,
                                    );
                                  }
                                : () {
                                    controller.pageControlelr.nextPage(
                                        duration:
                                            const Duration(milliseconds: 100),
                                        curve: Curves.bounceIn);
                                  }),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        // SizedBox(
        //     width: double.maxFinite,
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //          SizedBox(
        //              height: getVerticalSize(561),
        //              width: double.maxFinite,
        //              child:
        //              Stack(alignment: Alignment.topRight, children: [
        //               CustomImageView(
        //                   imagePath: ImageConstant.imgRectangle4443,
        //                   height: getVerticalSize(561),
        //                   width: getHorizontalSize(428),
        //                   alignment: Alignment.center),
        //               Align(
        //                   alignment: Alignment.topRight,
        //                   child: GestureDetector(
        //                       onTap: () {
        //                        onTapTxtSkip();
        //                       },
        //                       child: Padding(
        //                           padding: getPadding(top: 19, right: 20),
        //                           child: Text("lbl_skip".tr,
        //                               overflow: TextOverflow.ellipsis,
        //                               textAlign: TextAlign.left,
        //                               style: theme.textTheme.bodyLarge))))
        //              ])),
        //          Padding(
        //              padding: getPadding(top: 16),
        //              child: Text("lbl_home_insurance".tr,
        //                  overflow: TextOverflow.ellipsis,
        //                  textAlign: TextAlign.left,
        //                  style: theme.textTheme.displaySmall)),
        //          Container(
        //              width: getHorizontalSize(386),
        //              margin: getMargin(left: 21, top: 23, right: 20),
        //              child: Text("msg_home_insurance_is".tr,
        //                  maxLines: 2,
        //                  overflow: TextOverflow.ellipsis,
        //                  textAlign: TextAlign.center,
        //                  style: theme.textTheme.bodyLarge)),
        //          Container(
        //              height: getVerticalSize(8),
        //              margin: getMargin(top: 46, bottom: 5),
        //              child: AnimatedSmoothIndicator(
        //                  activeIndex: 0,
        //                  count: 3,
        //                  effect: ScrollingDotsEffect(
        //                      spacing: 8,
        //                      activeDotColor: theme.colorScheme.primary,
        //                      dotColor: theme.colorScheme.primary
        //                          .withOpacity(0.49),
        //                      dotHeight: getVerticalSize(8),
        //                      dotWidth: getHorizontalSize(8))))
        //         ])),
        // bottomNavigationBar: CustomElevatedButton(
        //     text: "lbl_next".tr,
        //     margin: getMargin(left: 20, right: 20, bottom: 40),
        //     buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
        //         fixedSize: MaterialStateProperty.all<Size>(
        //             Size(double.maxFinite, getVerticalSize(54)))),
        //     buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        //     onTap: () {
        //      onTapNext();
        //     })
      )),
    );
  }

  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingThreeScreen,
    );
  }

  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
