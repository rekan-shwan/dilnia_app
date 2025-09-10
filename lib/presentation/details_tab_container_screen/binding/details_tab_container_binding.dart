import '../controller/details_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DetailsTabContainerScreen.
///
/// This class ensures that the DetailsTabContainerController is created when the
/// DetailsTabContainerScreen is first loaded.
class DetailsTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsTabContainerController());
  }
}
