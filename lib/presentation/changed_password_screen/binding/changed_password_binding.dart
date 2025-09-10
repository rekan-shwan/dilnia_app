import '../controller/changed_password_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChangedPasswordScreen.
///
/// This class ensures that the ChangedPasswordController is created when the
/// ChangedPasswordScreen is first loaded.
class ChangedPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangedPasswordController());
  }
}
