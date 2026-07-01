import 'package:flutter/material.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';

/// A controller class for the ResetPasswordScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/reset_password_screen/models/reset_password_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/api_success_model.dart';

///
/// This class manages the state of the ResetPasswordScreen, including the
/// current resetPasswordModelObj
class ResetPasswordController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<ResetPasswordModel> resetPasswordModelObj = ResetPasswordModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;
  dynamic theDataFromPreviousPage = Get.arguments;
  final storage = GetStorage();
  var isLoading = false.obs;
  Future<void> forgotPass() async {
    debugPrint("*************** Re Send OTP Page  ***********");
    final phone = theDataFromPreviousPage[1];
    final email = theDataFromPreviousPage[0];
    final password = newpasswordController.text;
    final confirmPassword = confirmpasswordController.text;
    //  final password = otpController().text.trim();
    try {
      var headers = {
        accept: acceptValue,
      };

      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/forgot-password'));
      print(
          "password == $password confirmPassword == $confirmPassword phone == $phone email == $email");
      request.fields.addAll({
        "password": password,
        "password_confirmation": confirmPassword,
        "phone": phone,
        "email": email
      });
      debugPrint("request.fields  == ${request.fields}");
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("str  == $str");
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 200) {
        // Get.snackbar(
        //   'Success',
        //   res.message ?? 'Password Changed',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget()
            .showSnackBar(Get.context!, res.message ?? 'Password Changed');
        Get.toNamed(AppRoutes.loginScreen);
      } else {
        // Get.snackbar(
        //   'Error',
        //   res.message ?? 'Failed to Send. Please try again later.',
        // snackPosition: SnackPosition.BOTTOM,
        //);
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to Send. Please try again later.');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Something went wrong: $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
