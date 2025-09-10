import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/changed_password_screen/changed_password_screen.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:insurance_app/widgets/custom_text_form_field.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController controller = Get.put(ResetPasswordController());

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
              appBar: CustomAppBar(
                height: getVerticalSize(79),
                leadingWidth: getSize(42),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: false,
                title: AppbarTitle(text: "lbl_reset_password".tr),
              ),
              body: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 20, top: 25, right: 20, bottom: 25),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: getHorizontalSize(301),
                                margin: getMargin(right: 86),
                                child: Text("msg_please_enter_your4".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge)),
                            Obx(() => CustomTextFormField(
                                controller: controller.newpasswordController,
                                margin: getMargin(top: 42),
                                contentPadding:
                                    getPadding(left: 16, top: 17, bottom: 17),
                                hintText: "lbl_new_password".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputAction: TextInputAction.next,
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
                                            svgPath:
                                                controller.isShowPassword.value
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
                            Obx(() => CustomTextFormField(
                                controller:
                                    controller.confirmpasswordController,
                                margin: getMargin(top: 22),
                                contentPadding:
                                    getPadding(left: 16, top: 17, bottom: 17),
                                hintText: "msg_confirm_password".tr,
                                hintStyle: CustomTextStyles.bodyLargeGray600,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword1.value =
                                          !controller.isShowPassword1.value;
                                    },
                                    child: Container(
                                        margin: getMargin(
                                            left: 30,
                                            top: 15,
                                            right: 16,
                                            bottom: 15),
                                        child: CustomImageView(
                                            svgPath:
                                                controller.isShowPassword1.value
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
                                obscureText: controller.isShowPassword1.value,
                                filled: true,
                                fillColor: appTheme.gray50)),
                            CustomElevatedButton(
                                text: "lbl_create".tr,
                                margin: getMargin(top: 46, bottom: 5),
                                buttonStyle: CustomButtonStyles.fillPrimary
                                    .copyWith(
                                        fixedSize:
                                            WidgetStateProperty.all<Size>(Size(
                                                double.maxFinite,
                                                getVerticalSize(54)))),
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumWhiteA700,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.forgotPass();
                                    // showDialog(
                                    //   barrierDismissible: false,
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return AlertDialog(
                                    //       insetPadding: EdgeInsets.all(16),
                                    //       shape: RoundedRectangleBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(20)),
                                    //       contentPadding: EdgeInsets.zero,
                                    //       content: ChangedPasswordScreen(),
                                    //     );
                                    //   },
                                    // );
                                  }
                                })
                          ]))))),
    );
  }
}
