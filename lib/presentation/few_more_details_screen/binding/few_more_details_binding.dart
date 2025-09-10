import '../controller/few_more_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FewMoreDetailsScreen.
///
/// This class ensures that the FewMoreDetailsController is created when the
/// FewMoreDetailsScreen is first loaded.
class FewMoreDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FewMoreDetailsController());
  }
}
