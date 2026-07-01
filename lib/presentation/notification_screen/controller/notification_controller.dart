import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:flutter/material.dart';

import '../models/notification_model_data.dart';
import 'package:http/http.dart' as http;

/// A controller class for the NotificationScreen.
///
/// This class manages the state of the NotificationScreen, including the
/// current searchModelObj
class NotificationControllers extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<NotificationItemData> notificationListData =
      <NotificationItemData>[].obs;

  bool serching = false;
  var isLoading = false.obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();

    notificationList();
    // Load data when the controller is initialized
  }

  Future<void> notificationList() async {
    debugPrint("*************** notificationList  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    debugPrint("*************** token == $acceptToken  ***********");
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request =
          http.Request('GET', Uri.parse('$baseUrl/user/notification/list'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        debugPrint("Notification str = $str");
        NotificationListModel notificationListModel =
            NotificationListModel.fromJson(str);
        notificationListData.assignAll(notificationListModel.data?.data ?? []);

        // Get.snackbar(
        //   'Success',
        //   'Get Notification Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } else {
        // Get.snackbar(
        //   'Error',
        //   'Failed to get Notification. Please try again later.',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget().showSnackBar(Get.context!,
            'Failed to get Notification. Please try again later.');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
