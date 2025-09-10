import 'package:get/get.dart';

import '../../core/utils/pref_utils.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/log_out_popup_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LogOutPopupScreen extends GetWidget<LogOutPopupController> {
  const LogOutPopupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder: (controller) => Container(
        decoration: AppDecoration.white.copyWith(
            color: appTheme.whiteA700,
            borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Padding(
          padding: getPadding(top: 24, bottom: 24, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: getPadding(
                    top: 2,
                  ),
                  child: Text(
                    "lbl_logout".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleLargeBold,
                  )),
              Padding(
                padding: getPadding(top: 48),
                child: Row(
                  children: [
                    CustomOutlinedButton(
                      width: getSize(170),
                      text: "lbl_cancel".tr,
                      onTap: () {
                        Get.back();
                      },
                      buttonStyle: CustomButtonStyles.outlinePrimary.copyWith(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                        double.maxFinite,
                        getVerticalSize(
                          54,
                        ),
                      ))),
                      buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
                    ),
                    SizedBox(
                      width: getHorizontalSize(16),
                    ),
                    CustomElevatedButton(
                      width: getSize(170),
                      text: "lbl_logout_confirm".tr,
                      onTap: () {
                        PrefUtils.setIsSignIn(true);
                        controller.getIndex(0);
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                      buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                        double.maxFinite,
                        getVerticalSize(
                          54,
                        ),
                      ))),
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
