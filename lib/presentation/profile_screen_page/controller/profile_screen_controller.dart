import 'package:insurance_app/core/app_export.dart';

/// A controller class for the ProfileScreenPage.
///
/// This class manages the state of the ProfileScreenPage, including the
/// current profileScreenModelObj
class ProfileScreenController extends GetxController {
  var user = ''.obs;
  var user_email = ''.obs;
  var user_phone = ''.obs;
  var user_image = ''.obs;

  // Local storage
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    getDetails();
    // Load data when the controller is initialized
  }

  getDetails() {
    user.value = storage.read('user');
    user_email.value = storage.read('user_email') ?? '';
    user_phone.value = storage.read('user_phone') ?? '';
    user_image.value = storage.read('user_image') ?? '';
  }
}
