import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/core/utils/validation_functions.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import 'controller/login_error_controller.dart';

// ignore_for_file: must_be_immutable
class LoginErrorScreen extends GetWidget<LoginErrorController> {
  LoginErrorScreen({Key? key}) : super(key: key);

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
                          Container(
                              height: getVerticalSize(219),
                              width: getHorizontalSize(388),
                              margin: getMargin(top: 46),
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                            height: getVerticalSize(212),
                                            width: getHorizontalSize(388),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            onTapMasterdropdown();
                                                          },
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomTextFormField(
                                                                    controller: controller
                                                                        .emailController,
                                                                    contentPadding: getPadding(
                                                                        left:
                                                                            16,
                                                                        top: 17,
                                                                        right:
                                                                            16,
                                                                        bottom:
                                                                            17),
                                                                    textStyle:
                                                                        CustomTextStyles
                                                                            .bodyLargeGray600,
                                                                    hintText:
                                                                        "lbl_email_address"
                                                                            .tr,
                                                                    hintStyle:
                                                                        CustomTextStyles
                                                                            .bodyLargeGray600,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    textInputType:
                                                                        TextInputType
                                                                            .emailAddress,
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          (!isValidEmail(
                                                                              value,
                                                                              isRequired: true))) {
                                                                        return "Please enter valid email";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        appTheme
                                                                            .gray50,
                                                                    defaultBorderDecoration:
                                                                        TextFormFieldStyleHelper
                                                                            .outlineRed700,
                                                                    enabledBorderDecoration:
                                                                        TextFormFieldStyleHelper
                                                                            .outlineRed700,
                                                                    focusedBorderDecoration:
                                                                        TextFormFieldStyleHelper
                                                                            .outlineRed700,
                                                                    disabledBorderDecoration:
                                                                        TextFormFieldStyleHelper
                                                                            .outlineRed700),
                                                                CustomTextFormField(
                                                                    width: getHorizontalSize(
                                                                        188),
                                                                    controller:
                                                                        controller
                                                                            .emailoneController,
                                                                    margin: getMargin(
                                                                        top:
                                                                            40),
                                                                    textStyle:
                                                                        CustomTextStyles
                                                                            .bodyMediumRed700,
                                                                    hintText:
                                                                        "msg_please_enter_your2"
                                                                            .tr,
                                                                    hintStyle:
                                                                        CustomTextStyles
                                                                            .bodyMediumRed700,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    textInputType:
                                                                        TextInputType
                                                                            .emailAddress,
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          (!isValidEmail(
                                                                              value,
                                                                              isRequired: true))) {
                                                                        return "Please enter valid email";
                                                                      }
                                                                      return null;
                                                                    })
                                                              ]))),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            onTapMasterdropdown1();
                                                          },
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Obx(() => CustomTextFormField(
                                                                    controller: controller.passwordController,
                                                                    contentPadding: getPadding(left: 16, top: 17, bottom: 17),
                                                                    textStyle: CustomTextStyles.bodyLargeGray600,
                                                                    hintText: "lbl_password".tr,
                                                                    hintStyle: CustomTextStyles.bodyLargeGray600,
                                                                    textInputType: TextInputType.visiblePassword,
                                                                    suffix: InkWell(
                                                                        onTap: () {
                                                                          controller
                                                                              .isShowPassword
                                                                              .value = !controller.isShowPassword.value;
                                                                        },
                                                                        child: Container(margin: getMargin(left: 30, top: 15, right: 16, bottom: 15), child: CustomImageView(svgPath: controller.isShowPassword.value ? ImageConstant.imgEye : ImageConstant.imgEye))),
                                                                    suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(54)),
                                                                    validator: (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          (!isValidPassword(
                                                                              value,
                                                                              isRequired: true))) {
                                                                        return "Please enter valid password";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    obscureText: controller.isShowPassword.value,
                                                                    filled: true,
                                                                    fillColor: appTheme.gray50,
                                                                    defaultBorderDecoration: TextFormFieldStyleHelper.outlineRed700,
                                                                    enabledBorderDecoration: TextFormFieldStyleHelper.outlineRed700,
                                                                    focusedBorderDecoration: TextFormFieldStyleHelper.outlineRed700,
                                                                    disabledBorderDecoration: TextFormFieldStyleHelper.outlineRed700)),
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                40),
                                                                    child: Text(
                                                                        "msg_please_enter_your3"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: CustomTextStyles
                                                                            .bodyMediumRed700))
                                                              ])))
                                                ]))),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              onTapTxtForgotpassword();
                                            },
                                            child: Text(
                                                "msg_forgot_password".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    theme.textTheme.bodyLarge)))
                                  ])),
                          CustomElevatedButton(
                              text: "lbl_log_in".tr,
                              margin: getMargin(top: 51),
                              buttonStyle: CustomButtonStyles.fillPrimary
                                  .copyWith(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(Size(
                                              double.maxFinite,
                                              getVerticalSize(54)))),
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumWhiteA700,
                              onTap: () {
                                onTapLogin();
                              }),
                          Spacer(),
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

  /// Navigates to the loginActiveScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the loginActiveScreen.
  onTapMasterdropdown() {
    Get.toNamed(
      AppRoutes.loginActiveScreen,
    );
  }

  /// Navigates to the loginActiveScreen when the action is triggered.

  /// When the action is triggered, this function uses the `Get` package to
  /// push the named route for the loginActiveScreen.
  onTapMasterdropdown1() {
    Get.toNamed(
      AppRoutes.loginActiveScreen,
    );
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
  onTapLogin() {
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
