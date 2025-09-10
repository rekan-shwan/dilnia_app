import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import 'controller/select_year_popup_controller.dart';

// ignore: must_be_immutable
class SelectYearPopupScreen extends GetWidget<SelectYearPopupController> {
  SelectYearPopupScreen({Key? key}) : super(key: key);
  List ly = ["2000", "2001"];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoPicker(
            children: [],
            itemExtent: 100,
            onSelectedItemChanged: (value) {},
          ),
          Container(
              padding: getPadding(left: 20, top: 27, right: 20, bottom: 27),
              decoration: AppDecoration.white
                  .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                        text: "lbl_select_year".tr,
                        rightIcon: Container(
                            margin: getMargin(left: 30),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgClose)),
                        buttonStyle: CustomButtonStyles.none.copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(double.maxFinite, getVerticalSize(25)))),
                        buttonTextStyle: CustomTextStyles.titleLargeBold_1,
                        onTap: () {
                          onTapSelectyear();
                        }),
                    Opacity(
                        opacity: 0.2,
                        child: Padding(
                            padding: getPadding(top: 19),
                            child: Text("lbl_2000".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyLargeBlack900_2))),
                    Opacity(
                        opacity: 0.4,
                        child: Padding(
                            padding: getPadding(top: 12),
                            child: Text("lbl_2000".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyLargeBlack900_1))),
                    Opacity(
                        opacity: 0.6,
                        child: Padding(
                            padding: getPadding(top: 12),
                            child: Text("lbl_2001".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyLargeBlack900))),
                    Padding(
                        padding: getPadding(top: 9),
                        child: SizedBox(
                            width: getHorizontalSize(244),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: appTheme.gray200))),
                    Padding(
                        padding: getPadding(top: 10),
                        child: Text("lbl_2002".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium)),
                    Padding(
                        padding: getPadding(top: 10),
                        child: SizedBox(
                            width: getHorizontalSize(244),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: appTheme.gray200))),
                    Opacity(
                        opacity: 0.6,
                        child: Padding(
                            padding: getPadding(top: 10),
                            child: Text("lbl_2003".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyLargeBlack900))),
                    Opacity(
                        opacity: 0.4,
                        child: Padding(
                            padding: getPadding(top: 12),
                            child: Text("lbl_2004".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyLargeBlack900_1))),
                    Opacity(
                        opacity: 0.2,
                        child: Padding(
                            padding: getPadding(top: 12),
                            child: Text("lbl_2005".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyLargeBlack900_2))),
                    CustomElevatedButton(
                        text: "lbl_ok".tr,
                        margin: getMargin(top: 25, bottom: 5),
                        buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(
                                Size(double.maxFinite, getVerticalSize(54)))),
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700)
                  ]))
        ]);
  }

  onTapSelectyear() {
    Get.toNamed(
      AppRoutes.verifyBikeDetailsScreen,
    );
  }
}
