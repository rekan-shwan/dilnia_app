import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/custom_elevated_button_loading.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());

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
        Get.back();
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppbarImage(
                                  height: getVerticalSize(150),
                                  width: getHorizontalSize(300),
                                  svgPath: ImageConstant.logoLarge,
                                  // margin: getMargin(left: 16, top: 29, bottom: 26),

                                  onTap: () {}),
                              Padding(
                                  padding: getPadding(top: 7),
                                  child: Text("lbl_sign_up".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.displaySmall)),
                              Container(
                                  width: getHorizontalSize(332),
                                  margin: getMargin(top: 12, right: 0),
                                  child: Text("msg_please_enter_your".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyLarge)),
                              CustomTextFormField(
                                  controller: controller.firstnameController,
                                  margin: getMargin(top: 46),
                                  contentPadding: getPadding(
                                      left: 16, top: 17, right: 16, bottom: 17),
                                  hintText: "lbl_full_name".tr,
                                  hintStyle: CustomTextStyles.bodyLargeGray600,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid name";
                                    }
                                    return null;
                                  },
                                  filled: true,
                                  fillColor: appTheme.gray50),
                              CustomTextFormField(
                                  controller: controller.phoneController,
                                  margin: getMargin(top: 22),
                                  contentPadding: getPadding(
                                      left: 16, top: 17, right: 16, bottom: 17),
                                  hintText: "lbl_mobile".tr,
                                  hintStyle: CustomTextStyles.bodyLargeGray600,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid mobile";
                                    }
                                    return null;
                                  },
                                  filled: true,
                                  fillColor: appTheme.gray50),
                              CustomTextFormField(
                                  controller: controller.emailController,
                                  margin: getMargin(top: 22),
                                  contentPadding: getPadding(
                                      left: 16, top: 17, right: 16, bottom: 17),
                                  hintText: "lbl_email_address".tr,
                                  hintStyle: CustomTextStyles.bodyLargeGray600,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid email";
                                    } else if (!isValidEmail(value)) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  },
                                  filled: true,
                                  fillColor: appTheme.gray50),
                              Obx(() => CustomTextFormField(
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
                              Obx(() => controller.isLoading.value
                                  ? CustomElevatedButtonLoading(
                                      text: "lbl_sign_up".tr,
                                      margin: getMargin(top: 46),
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
                                      text: "lbl_sign_up".tr,
                                      margin: getMargin(top: 46),
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
                                          controller.signup();
                                        }
                                      })),
                              const SizedBox(height: 20),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtAlreadyhavean();
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "msg_already_have_an2".tr,
                                                style:
                                                    theme.textTheme.bodyLarge),
                                            TextSpan(
                                                text: " ",
                                                style: theme
                                                    .textTheme.titleMedium),
                                            TextSpan(
                                                text: "lbl_log_in".tr,
                                                style: CustomTextStyles
                                                    .titleMediumPrimary)
                                          ]),
                                          textAlign: TextAlign.left)))
                            ]))),
              ))),
    );
  }

  onTapSignup() {
    Get.back();
  }

  onTapTxtAlreadyhavean() {
    Get.back();
  }
}
