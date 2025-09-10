import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/app_bar/custom_app_bar.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_elevated_button_loading.dart';
import 'controller/otp_verification_controller.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final OtpVerificationController controller = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.black, size: 20),
              onPressed: () => Get.back(),
            ),
            centerTitle: false,
            title: AppbarTitle(text: "msg_otp_verification".tr),
          ),
          body: Container(
            width: double.maxFinite,
            padding: getPadding(left: 20, top: 26, right: 20, bottom: 26),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "تم إرسال كود إلى: ${controller.theDataFromPreviousPage[0]}"),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getHorizontalSize(343),
                      margin: getMargin(right: 44),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_lease_enter_your_otp".tr,
                              style: theme.textTheme.bodyLarge,
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 42, right: 2),
                    child: Obx(() => Pinput(
                          errorTextStyle: TextStyle(
                            color: appTheme.red700,
                            fontSize: getFontSize(13),
                            fontFamily: 'SF UI Text',
                            fontWeight: FontWeight.w400,
                          ),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          controller: controller.otpController.value,
                          length: 6,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter valid OTP";
                            }
                            return null;
                          },
                          errorPinTheme: PinTheme(
                            padding: getPadding(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              border: Border.all(color: appTheme.red700),
                              borderRadius:
                                  BorderRadius.circular(getHorizontalSize(16)),
                            ),
                            textStyle: TextStyle(
                              color: appTheme.red700,
                              fontSize: getFontSize(14),
                              fontFamily: 'SF UI Text',
                              fontWeight: FontWeight.w400,
                            ),
                            width: getHorizontalSize(50),
                            height: getVerticalSize(50),
                          ),
                          defaultPinTheme: PinTheme(
                            padding: getPadding(left: 8, right: 8),
                            width: getHorizontalSize(51),
                            height: getVerticalSize(51),
                            textStyle: TextStyle(
                              color: appTheme.black900,
                              fontSize: getFontSize(24),
                              fontFamily: 'SF UI Text',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: BoxDecoration(
                              color: appTheme.gray50,
                              border: Border.all(color: appTheme.gray50),
                              borderRadius:
                                  BorderRadius.circular(getHorizontalSize(16)),
                            ),
                          ),
                        )),
                  ),
                  Obx(() {
                    return Padding(
                      padding: getPadding(top: 31),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_didn_t_get_code2".tr,
                              style: theme.textTheme.bodyLarge,
                            ),
                            const TextSpan(text: " "),
                            controller.isButtonActive.value
                                ? TextSpan(
                                    text: "lbl_resend_otp".tr,
                                    style: CustomTextStyles.titleMediumPrimary,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.resendOtp();
                                      },
                                  )
                                : TextSpan(
                                    text:
                                        " (${controller.timerDuration.value}s)",
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: appTheme.gray600,
                                    ),
                                  ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    );
                  }),
                  Obx(() {
                    return controller.isLoading.value
                        ? CustomElevatedButtonLoading(
                            text: "lbl_next".tr,
                            margin: getMargin(top: 49, bottom: 5),
                            buttonStyle:
                                CustomButtonStyles.fillPrimary.copyWith(
                              fixedSize: WidgetStateProperty.all<Size>(
                                Size(double.maxFinite, getVerticalSize(54)),
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                          )
                        : CustomElevatedButton(
                            text: "lbl_next".tr,
                            margin: getMargin(top: 49, bottom: 5),
                            buttonStyle:
                                CustomButtonStyles.fillPrimary.copyWith(
                              fixedSize: WidgetStateProperty.all<Size>(
                                Size(double.maxFinite, getVerticalSize(54)),
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.titleMediumWhiteA700,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                controller.otpSubmit();
                              }
                            },
                          );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
