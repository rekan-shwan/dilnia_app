import '../controller/login_active_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginActiveScreen.
///
/// This class ensures that the LoginActiveController is created when the
/// LoginActiveScreen is first loaded.
class LoginActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginActiveController());
  }
}
