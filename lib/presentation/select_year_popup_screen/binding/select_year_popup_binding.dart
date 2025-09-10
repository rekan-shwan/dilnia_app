import '../controller/select_year_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectYearPopupScreen.
///
/// This class ensures that the SelectYearPopupController is created when the
/// SelectYearPopupScreen is first loaded.
class SelectYearPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectYearPopupController());
  }
}
