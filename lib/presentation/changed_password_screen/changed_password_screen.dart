import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

import 'controller/changed_password_controller.dart';

class ChangedPasswordScreen extends GetWidget<ChangedPasswordController> {
  const ChangedPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
                svgPath: ImageConstant.imgVector,
                height: getSize(103),
                width: getSize(103),
                margin: getMargin(top: 10)),
            Padding(
                padding: getPadding(top: 31),
                child: Text("msg_password_changed".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleLargeBold)),
            Container(
                width: getHorizontalSize(332),
                margin: getMargin(left: 7, top: 19, right: 7),
                child: Text("msg_your_password_has".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge)),
            CustomElevatedButton(
                text: "lbl_create".tr,
                margin: getMargin(top: 30),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                    fixedSize: WidgetStateProperty.all<Size>(
                        Size(double.maxFinite, getVerticalSize(54)))),
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                onTap: () {
                  onTapCreate();
                })
          ]),
    );

    // Container(
    //    margin: getMargin(bottom: 5),
    //    padding: getPadding(
    //        left: 20, top: 24, right: 20, bottom: 24),
    //    decoration: AppDecoration.white.copyWith(
    //        borderRadius: BorderRadiusStyle.roundedBorder24),
    //     )
  }

  onTapCreate() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
