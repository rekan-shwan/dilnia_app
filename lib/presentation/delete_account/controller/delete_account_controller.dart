import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

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
      Get.snackbar(
        'Error',
        'No token found. Please login again.',
        snackPosition: SnackPosition.BOTTOM,
      );
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

        Get.snackbar(
          'Success',
          res.message ?? 'Account deleted successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );

        debugPrint("Navigating to login screen...");
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        debugPrint("Delete failed. Message: ${res.message}");
        Get.snackbar(
          'Error',
          res.message ?? 'Failed to delete account.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint("Exception caught during delete: $e");
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      debugPrint("deleteAccount() finished.");
    }
  }
}
