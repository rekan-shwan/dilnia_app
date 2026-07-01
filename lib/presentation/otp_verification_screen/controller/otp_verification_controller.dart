import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/data/models/api_success_model.dart';
import 'package:insurance_app/presentation/otp_verification_screen/models/otp_verification_model.dart';

class OtpVerificationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  Rx<OtpVerificationModel> otpVerificationModelObj = OtpVerificationModel().obs;

  dynamic theDataFromPreviousPage = Get.arguments;

  final storage = GetStorage();
  var isLoading = false.obs;
  var timerDuration = 30.obs;
  var isButtonActive = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    debugPrint("*************** OTP Page ***********");
    debugPrint(theDataFromPreviousPage.toString());
    listenForCode();
    startTimer();
  }

  /// Starts the 30s countdown timer and disables the resend button
  void startTimer() {
    isButtonActive.value = false;
    timerDuration.value = 30;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerDuration.value > 0) {
        timerDuration.value--;
      } else {
        timer.cancel();
        isButtonActive.value = true;
      }
    });
  }

  /// OTP Submission Logic
  Future<void> otpSubmit() async {
    final otp = otpController().text.trim();
    final type = theDataFromPreviousPage[2];
    final phone = theDataFromPreviousPage[1];
    final email = theDataFromPreviousPage[0];

    debugPrint("Email: $email");
    debugPrint("Phone: $phone");
    debugPrint("Type: $type");
    if (otp.isEmpty) {
      // Get.snackbar('Error', 'OTP cannot be empty',
      //     snackPosition: SnackPosition.BOTTOM);
      SnackBarWidget().showSnackBar(Get.context!, 'OTP cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      var headers = {accept: acceptValue};
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/submit-otp'));

      request.fields.addAll({
        "otp": otp,
        "type": type,
        "phone": phone,
        "email": email,
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      debugPrint("Response: $str");

      final res = ApiSuccessResponseModel.fromJson(str);

      if (response.statusCode == 200) {
        SnackBarWidget()
            .showSnackBar(Get.context!, res.message ?? 'OTP Verified');
        if (type == 'registration') {
          Get.toNamed(AppRoutes.loginScreen);
        } else if (type == 'forgot_pass') {
          Get.toNamed(AppRoutes.resetPasswordScreen, arguments: [email, phone]);
        }
      } else {
        SnackBarWidget()
            .showSnackBar(Get.context!, res.message ?? 'Failed to verify OTP');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Resend OTP API + Timer restart
  Future<void> resendOtp() async {
    if (theDataFromPreviousPage == null || theDataFromPreviousPage.length < 3) {
      SnackBarWidget().showSnackBar(Get.context!, 'Missing data to resend OTP');
      return;
    }

    final type = theDataFromPreviousPage[2];
    final phone = theDataFromPreviousPage[1];
    final email = theDataFromPreviousPage[0];

    isLoading.value = true;

    try {
      var headers = {accept: acceptValue};
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/send-otp'));

      request.fields.addAll({
        "email": email,
        "type": type,
        "phone": phone,
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      debugPrint("Resend Response: $str");

      final res = ApiSuccessResponseModel.fromJson(str);

      if (response.statusCode == 200) {
        SnackBarWidget().showSnackBar(Get.context!, res.message ?? 'OTP Sent');
        startTimer();
      } else {
        SnackBarWidget()
            .showSnackBar(Get.context!, res.message ?? 'Failed to send OTP');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Auto-fill OTP when received
  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.value.dispose();
    cancel(); // cancel SMS listener
    super.onClose();
  }
}
