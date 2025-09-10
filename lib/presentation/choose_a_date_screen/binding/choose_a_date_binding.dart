import '../controller/choose_a_date_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseADateScreen.
///
/// This class ensures that the ChooseADateController is created when the
/// ChooseADateScreen is first loaded.
class ChooseADateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseADateController());
  }
}
