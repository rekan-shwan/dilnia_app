import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

/// A controller class for the SignUpScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/sign_up_screen/models/sign_up_model.dart';

import '../../../data/models/api_success_model.dart';

///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController firstnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;
  final storage = GetStorage();
  var isLoading = false.obs;
  Future<void> signup() async {
    debugPrint("*************** signup  ***********");
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = firstnameController.text.trim();
    final phone = phoneController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      snackbarAlert(Get.context!, 'Email and Password cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      var headers = {
        accept: acceptValue,
      };

      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/register'));

      request.fields.addAll({
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
        'password_confirmation': password
      });
      debugPrint("request.fields  == ${request.fields}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("str  == $str");
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 200) {
        snackbarAlert(Get.context!, res.message ?? 'Registration Successful');
        // Navigate to the home screen
        Get.toNamed(AppRoutes.otpVerificationScreen,
            arguments: [email, phone, 'registration']);
      } else {
        snackbarAlert(Get.context!,
            res.message ?? 'Failed to register. Please try again later.');
      }
    } catch (e) {
      snackbarAlert(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    // emailController.dispose();
    // passwordController.dispose();
    // firstnameController.dispose();
    // phoneController.dispose();
    // passwordController.dispose();
  }

  void snackbarAlert(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
