import 'package:insurance_app/added/snack_bar_widget.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../home_screen_container_page/controller/home_screen_container_controller.dart';
import '../../profile_screen_page/controller/profile_screen_controller.dart';

/// A controller class for the MyProfileScreen.
///
/// This class manages the state of the MyProfileScreen, including the
/// current myProfileModelObj
class MyProfileController extends GetxController {
  var isLoading = false.obs;
  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;
  var user = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;

  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    userDetails();
    getDetails();
    // Load data when the controller is initialized
  }

  getDetails() {
    user.value = storage.read('user');
    userEmail.value = storage.read('user_email') ?? '';
    userPhone.value = storage.read('user_phone') ?? '';
  }

  Future<void> userDetails() async {
    debugPrint("*************** userDetails  ***********");
    isLoading.value = true;
    final acceptToken = storage.read('token');
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request = http.Request('GET', Uri.parse('$baseUrl/me'));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("User Details str = $str");
      if (response.statusCode == 200) {
        MyProfileModel listModel = MyProfileModel.fromJson(str);
        myProfileModelObj.value = listModel;
        storage.write('user_image', listModel.data?.imagePath ?? ' ');

        update();
        isLoading.value = false;
        debugPrint("User Details Data == ${listModel.toString()}");
        final ProfileScreenController profileScreenController = Get.find<
            ProfileScreenController>(); // Trigger reload in ProfileController
        profileScreenController.getDetails();
        final HomeScreenContainerController homeScreenController = Get.find<
            HomeScreenContainerController>(); // Trigger reload in ProfileController
        final data2 = homeScreenController.loadUserData();
        // Get.snackbar(
        //   'Success',
        //   'Get User Details Successful',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        SnackBarWidget()
            .showSnackBar(Get.context!, 'User Details Loaded Successfully');
      } else {
        SnackBarWidget().showSnackBar(Get.context!,
            'Failed to get User Details. Please try again later.');
      }
    } catch (e) {
      SnackBarWidget().showSnackBar(Get.context!, 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
