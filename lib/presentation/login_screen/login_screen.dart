import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/core/utils/validation_functions.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/custom_elevated_button_loading.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        closeApp();
        return true;
      },
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: appTheme.whiteA700,
              body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 20, top: 40, right: 20, bottom: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppbarImage(
                                  height: getVerticalSize(150),
                                  width: getHorizontalSize(300),
                                  svgPath: ImageConstant.logoLarge,
                                  // margin: getMargin(left: 16, top: 29, bottom: 26),

                                  onTap: () {}),
                              Padding(
                                  padding: getPadding(top: 0),
                                  child: Text("lbl_log_in".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.displaySmall)),
                              Container(
                                  width: getHorizontalSize(354),
                                  margin: getMargin(top: 12, right: 0),
                                  child: Text("msg_please_enter_your".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      //  textAlign: TextAlign.left,
                                      style: theme.textTheme.bodyLarge)),
                              CustomTextFormField(
                                  autofocus: false,
                                  controller: controller.emailController,
                                  margin: getMargin(top: 48),
                                  contentPadding: getPadding(
                                      left: 16, top: 17, right: 16, bottom: 17),
                                  hintText: "lbl_email_address".tr,
                                  hintStyle: CustomTextStyles.bodyLargeGray600,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  },
                                  filled: true,
                                  fillColor: appTheme.gray50),
                              Obx(() => CustomTextFormField(
                                  autofocus: false,
                                  controller: controller.passwordController,
                                  margin: getMargin(top: 22),
                                  contentPadding:
                                      getPadding(left: 16, top: 17, bottom: 17),
                                  hintText: "lbl_password".tr,
                                  hintStyle: CustomTextStyles.bodyLargeGray600,
                                  textInputType: TextInputType.visiblePassword,
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
                                              svgPath: controller
                                                      .isShowPassword.value
                                                  ? ImageConstant.imgEyeOff
                                                  : ImageConstant.imgEye))),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(54)),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  },
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
                                          padding: getPadding(top: 18),
                                          child: Text("msg_forgot_password".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  theme.textTheme.bodyLarge)))),
                              Obx(() => controller.isLoading.value
                                  ? CustomElevatedButtonLoading(
                                      text: "lbl_log_in".tr,
                                      margin: getMargin(top: 51),
                                      buttonStyle: CustomButtonStyles
                                          .fillPrimary
                                          .copyWith(
                                              fixedSize: WidgetStateProperty
                                                  .all<Size>(Size(
                                                      double.maxFinite,
                                                      getVerticalSize(54)))),
                                      buttonTextStyle:
                                          CustomTextStyles.titleMediumWhiteA700,
                                    )
                                  : CustomElevatedButton(
                                      text: "lbl_log_in".tr,
                                      margin: getMargin(top: 51),
                                      buttonStyle: CustomButtonStyles
                                          .fillPrimary
                                          .copyWith(
                                              fixedSize: WidgetStateProperty
                                                  .all<Size>(Size(
                                                      double.maxFinite,
                                                      getVerticalSize(54)))),
                                      buttonTextStyle:
                                          CustomTextStyles.titleMediumWhiteA700,
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          PrefUtils.setIsSignIn(false);
                                          controller.login();
                                          // onTapLogin();
                                        }
                                      })),
                              // Spacer(),
                              const SizedBox(height: 20),
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
                                                    "msg_don_t_have_an_account2"
                                                        .tr,
                                                style:
                                                    theme.textTheme.bodyLarge),
                                            TextSpan(
                                                text: "lbl_sign_up".tr,
                                                style: CustomTextStyles
                                                    .titleMediumPrimary)
                                          ]),
                                          textAlign: TextAlign.left)))
                            ]))),
              ))),
    );
  }

  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapLogin() {
    Get.toNamed(
      AppRoutes.resetPasswordScreen,
    );
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
