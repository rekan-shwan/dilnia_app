import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:insurance_app/added/snack_bar_widget.dart';

import '../../../core/app_export.dart';
import '../../../data/models/api_success_model.dart';

class DeleteAccountController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage();

  Future<void> deleteAccount() async {
    debugPrint("======= Starting deleteAccount()...");

    final token = storage.read('token');
    debugPrint("Token from storage: $token");

    if (token == null) {
      SnackBarWidget()
          .showSnackBar(Get.context!, 'No token found. Please login again.');
      return;
    }

    isLoading.value = true;

    try {
      var headers = {
        'Authorization': 'Bearer $token',
        'Accept': acceptValue,
      };

      debugPrint("Headers: $headers");

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/delete-account'),
      );
      request.headers.addAll(headers);

      debugPrint("Sending request to $baseUrl/delete-account");

      http.StreamedResponse response = await request.send();
      var responseStr = await response.stream.bytesToString();

      debugPrint("Raw response string: $responseStr");

      final res = ApiSuccessResponseModel.fromJson(responseStr);

      if (response.statusCode == 200 && res.success == true) {
        debugPrint("Delete success. Erasing local storage...");
        await storage.erase();

        SnackBarWidget().showSnackBar(
            Get.context!, res.message ?? 'Account deleted successfully.');

        debugPrint("Navigating to login screen...");
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        debugPrint("Delete failed. Message: ${res.message}");

        SnackBarWidget().showSnackBar(
            Get.context!, res.message ?? 'Failed to delete account.');
      }
    } catch (e) {
      debugPrint("Exception caught during delete: $e");
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
      debugPrint("deleteAccount() finished.");
    }
  }
}
