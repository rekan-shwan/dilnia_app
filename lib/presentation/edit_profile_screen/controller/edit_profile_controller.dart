import 'package:flutter/material.dart';
import 'package:insurance_app/added/snack_bar_widget.dart';

/// A controller class for the EditProfileScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/edit_profile_screen/models/edit_profile_model.dart';

import '../../../data/models/api_success_model.dart';
import '../../my_profile_screen/controller/my_profile_controller.dart';
import '../../my_profile_screen/models/my_profile_model.dart';
import 'package:http/http.dart' as http;

import '../../profile_screen_page/controller/profile_screen_controller.dart';

///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController firstnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController imageController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  var isLoading = false.obs;
  UserData? userData = Get.arguments;
  String userImage = '';
  var gender = ''.obs;
  var image = ''.obs;
  // Local storage
  final storage = GetStorage();
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  @override
  void onInit() {
    super.onInit();
    debugPrint("USER DATA == ${userData!.name}");
    updateData();
  }

  updateData() {
    if (userData != null) {
      firstnameController = TextEditingController(text: userData!.name);

      phoneController = TextEditingController(text: userData!.phone);
      userImage = userData?.imagePath;
      emailoneController = TextEditingController(text: userData!.email);
      addressController = TextEditingController(text: userData!.address);
      gender.value = userData?.gender ?? null;
      dobController = TextEditingController(
          text: userData!.dob.toString().isNotEmpty
              ? userData!.dob.toString().substring(0, 10)
              : '');
      bioController = TextEditingController(text: userData!.bio);
    }
  }

  Future<void> submitProfile() async {
    debugPrint("*************** submitProfile  ***********");
    final acceptToken = storage.read('token');
    isLoading.value = true;
    try {
      var headers = {
        accept: acceptValue,
        'Authorization': 'Bearer $acceptToken'
      };

      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/update-profile'));
      request.fields.addAll({
        'name': firstnameController.text,
        'address': addressController.text,
        'phone': phoneController.text,
        'gender': gender.value,
        'dob': dobController.text,
        'bio': bioController.text,
        '_method': 'PUT'
      });
      if (image.value.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.value));
      }

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var str = await response.stream.bytesToString();
      debugPrint("*************** update profile $str***********");
      final res = ApiSuccessResponseModel.fromJson(str);
      if (response.statusCode == 200) {
        debugPrint("update profile str  == $str");
        storage.write('user', firstnameController.text);
        //  storage.write('user_image', userData.data?.userInfo?.imagePath ?? '');
        storage.write('user_phone', phoneController.text);
        update();
        // Get the instance of ProfileController
        final MyProfileController profileController = Get.find<
            MyProfileController>(); // Trigger reload in ProfileController
        final data = profileController.userDetails();
        debugPrint("## profileController = $data");

        Get.back();

        SnackBarWidget()
            .showSnackBar(Get.context!, res.message ?? 'Profile Updated');

        // Navigate to the home screen
      } else {
        SnackBarWidget().showSnackBar(Get.context!,
            res.message ?? 'Failed to submit. Please try again later.');
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
    firstnameController.dispose();
    phoneController.dispose();
    emailoneController.dispose();
    addressController.dispose();

    dobController.dispose();
    bioController.dispose();
  }
}
