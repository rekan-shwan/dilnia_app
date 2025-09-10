import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/delete_account_controller.dart';

class DeleteAccountPopupScreen extends StatelessWidget {
  const DeleteAccountPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deleteController = Get.put(DeleteAccountController());

    return Container(
      decoration: AppDecoration.white.copyWith(
        color: appTheme.whiteA700,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Padding(
        padding: getPadding(top: 24, bottom: 24, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "delete_account_confirm".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleLargeBold,
            ),
            Padding(
              padding: getPadding(top: 48),
              child: Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      text: "lbl_cancel".tr,
                      onTap: () {
                        Get.back();
                      },
                      buttonStyle: CustomButtonStyles.outlinePrimary.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(54)),
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.titleMediumPrimary_1,
                    ),
                  ),
                  SizedBox(width: getHorizontalSize(16)),
                  Expanded(
                    child: Obx(() => CustomElevatedButton(
                          text: deleteController.isLoading.value
                              ? "lbl_deleting".tr
                              : "lbl_confirm".tr,
                          onTap: () {
                            if (!deleteController.isLoading.value) {
                              deleteController.deleteAccount();
                            }
                          },
                          buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(double.maxFinite, getVerticalSize(54)),
                            ),
                          ),
                          buttonTextStyle:
                              CustomTextStyles.titleMediumWhiteA700,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
