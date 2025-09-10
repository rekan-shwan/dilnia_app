import '../controller/select_add_ons_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectAddOnsScreen.
///
/// This class ensures that the SelectAddOnsController is created when the
/// SelectAddOnsScreen is first loaded.
class SelectAddOnsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectAddOnsController());
  }
}
