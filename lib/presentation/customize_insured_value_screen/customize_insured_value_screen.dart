import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import 'controller/customize_insured_value_controller.dart';

class CustomizeInsuredValueScreen extends StatefulWidget {
  const CustomizeInsuredValueScreen({super.key});

  @override
  State<CustomizeInsuredValueScreen> createState() =>
      _CustomizeInsuredValueScreenState();
}

class _CustomizeInsuredValueScreenState
    extends State<CustomizeInsuredValueScreen> {
  CustomizeInsuredValueController customizeInsuredValueController =
      Get.put(CustomizeInsuredValueController());
  double val = 50.00;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: getPadding(left: 0, top: 26, right: 0, bottom: 26),
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "msg_customize_insured".tr,
                            style: CustomTextStyles.titleLargeBold_1,
                          ),
                          CustomImageView(
                              onTap: () {
                                Get.back();
                              },
                              svgPath: ImageConstant.imgClose)
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 32),
                      child:
                      // Slider(
                      //     value: val,
                      //     max: 100,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         val = value;
                      //       });
                      //     }),
                    // ),

                    SliderTheme(
                        data: SliderThemeData(
                          // trackHeight: getSize(10),

                            trackShape: RoundedRectSliderTrackShape(),
                            activeTrackColor: theme.colorScheme.primary,
                            inactiveTrackColor: appTheme.gray200,
                            thumbColor: theme.colorScheme.primary,
                            thumbShape: RoundSliderThumbShape()),
                        child: Slider(

                            value: val,
                            min: 0.0,
                            max: 100.0,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            }))),
                    Padding(
                        padding: getPadding(top: 3,left: 20,right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_10_37".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleMedium),
                                    Padding(
                                        padding: getPadding(top: 5),
                                        child: Text("lbl_high_risk".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodyMedium))
                                  ]),
                              Padding(
                                  padding: getPadding(bottom: 1,),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("lbl_19_37".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.titleMedium),
                                        Padding(
                                            padding: getPadding(top: 4),
                                            child: Text("lbl_low_risk".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyMedium))
                                      ]))
                            ])),
                    Padding(
                      padding: getPadding(left: 20,right: 20),
                      child: CustomElevatedButton(
                          onTap: () {
                            Get.back();
                          },
                          text: "lbl_continue".tr,
                          margin: getMargin(top: 25, bottom: 5),
                          buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(double.maxFinite, getVerticalSize(54)))),
                          buttonTextStyle: CustomTextStyles.titleMediumWhiteA700),
                    )
                  ]))
        ]);
  }

  onTapCustomize() {
    Get.toNamed(
      AppRoutes.verifyBikeDetailsScreen,
    );
  }
}
