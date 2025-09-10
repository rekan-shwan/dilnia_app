import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/core/utils/validation_functions.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import 'controller/login_active_controller.dart';

// ignore_for_file: must_be_immutable
class LoginActiveScreen extends GetWidget<LoginActiveController> {
  LoginActiveScreen({super.key});

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: appTheme.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 20, top: 40, right: 20, bottom: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(top: 7),
                              child: Text("lbl_log_in".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.displaySmall)),
                          Container(
                              width: getHorizontalSize(326),
                              margin: getMargin(top: 12, right: 61),
                              child: Text("msg_please_enter_your".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyLarge)),
                          CustomTextFormField(
                              controller: controller.emailController,
                              margin: getMargin(top: 46),
                              contentPadding: getPadding(
                                  left: 16, top: 17, right: 16, bottom: 17),
                              textStyle: CustomTextStyles.bodyLarge16,
                              hintText: "lbl_email_address".tr,
                              hintStyle: CustomTextStyles.bodyLarge16,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                              filled: true,
                              fillColor: appTheme.gray50),
                          Obx(() => CustomTextFormField(
                              controller: controller.group1859Controller,
                              margin: getMargin(top: 22),
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 15,
                                          right: 16,
                                          bottom: 15),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
                              obscureText: controller.isShowPassword.value,
                              filled: true,
                              fillColor: appTheme.gray50)),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotpassword();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 18, right: 1),
                                      child: Text("msg_forgot_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodyLarge)))),
                          CustomElevatedButton(
                            text: "lbl_login2",
                            margin: getMargin(top: 47),
                            buttonStyle: CustomButtonStyles.fillPrimary
                                .copyWith(
                                    fixedSize: WidgetStateProperty.all<Size>(
                                        Size(double.maxFinite,
                                            getVerticalSize(54)))),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                            onTap: onTapLoginone,
                          ),
                          const Spacer(),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount();
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account3".tr,
                                            style: theme.textTheme.bodyLarge),
                                        TextSpan(
                                            text: " ",
                                            style: theme.textTheme.titleMedium),
                                        TextSpan(
                                            text: "lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .titleMediumPrimary)
                                      ]),
                                      textAlign: TextAlign.left)))
                        ])))));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the forgotPasswordScreen.
  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the homeScreenContainer1Screen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the homeScreenContainer1Screen.
  onTapLoginone() {
    Get.toNamed(
      AppRoutes.homeScreenContainer1Screen,
    );
  }

  /// Navigates to the signUpScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the signUpScreen.
  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
