import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/core/utils/validation_functions.dart';
import 'package:insurance_app/widgets/app_bar/appbar_title.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          appBar: CustomAppBar(
            height: getVerticalSize(79),
            leadingWidth: getSize(42),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: 20),
              onPressed: () => Get.back(),
            ),
            centerTitle: false,
            title: AppbarTitle(text: "lbl_forgot_password".tr),
          ),
          body: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              padding: getPadding(left: 20, top: 26, right: 20, bottom: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: getHorizontalSize(301),
                    child: Text(
                      "msg_please_enter_your4".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    margin: getMargin(top: 46),
                    contentPadding:
                        getPadding(left: 16, top: 17, right: 16, bottom: 17),
                    hintText: "lbl_email_address".tr,
                    hintStyle: CustomTextStyles.bodyLargeGray600,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          !isValidEmail(value, isRequired: true)) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                  CustomTextFormField(
                    controller: controller.phoneController,
                    margin: getMargin(top: 46),
                    contentPadding:
                        getPadding(left: 16, top: 17, right: 16, bottom: 17),
                    hintText: "lbl_mobile".tr,
                    hintStyle: CustomTextStyles.bodyLargeGray600,
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid mobile";
                      }
                      return null;
                    },
                    filled: true,
                    fillColor: appTheme.gray50,
                  ),
                  Obx(() => CustomElevatedButton(
                        text: controller.isLoading.value
                            ? "..."
                            : "lbl_continue".tr,
                        margin: getMargin(top: 46, bottom: 5),
                        buttonStyle: (controller.isLoading.value
                                ? CustomButtonStyles.fillPrimary
                                : CustomButtonStyles.fillPrimary)
                            .copyWith(
                                fixedSize: WidgetStateProperty.all<Size>(Size(
                                    double.infinity, getVerticalSize(54)))),
                        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                        onTap: controller.isLoading.value
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  controller.sendOtp();
                                }
                              },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
