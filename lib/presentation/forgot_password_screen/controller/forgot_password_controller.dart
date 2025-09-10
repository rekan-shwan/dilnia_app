import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import '../../../data/models/api_success_model.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  dynamic theDataFromPreviousPage = Get.arguments;
  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;
  Rx<bool> isShowPassword = true.obs;
  RxBool isLoading = false.obs;

  Future<void> sendOtp() async {
    if (isLoading.value) return; // لا تنفذ إذا كان بالفعل جاري الإرسال

    isLoading.value = true;
    debugPrint("*************** Re Send OTP Page ***********");

    final type = 'forgot_pass';
    final phone = phoneController.text;
    final email = emailController.text;

    try {
      var headers = {accept: acceptValue};
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/send-otp'));

      request.fields.addAll({"email": email, "type": type, "phone": phone});
      debugPrint("request.fields  == ${request.fields}");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      debugPrint("str  == $str");

      final res = ApiSuccessResponseModel.fromJson(str);

      if (response.statusCode == 200) {
        Get.snackbar('Success', res.message ?? 'OTP Sent',
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(AppRoutes.otpVerificationScreen,
            arguments: [email, phone, type]);
      } else {
        Get.snackbar('Error', res.message ?? 'Failed to send OTP',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // يرجع الحالة لطبيعتها
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
