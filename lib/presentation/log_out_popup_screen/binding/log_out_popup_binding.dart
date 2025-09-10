import '../controller/log_out_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogOutPopupScreen.
///
/// This class ensures that the LogOutPopupController is created when the
/// LogOutPopupScreen is first loaded.
class LogOutPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogOutPopupController());
  }
}
