import '../controller/customize_insured_value_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CustomizeInsuredValueScreen.
///
/// This class ensures that the CustomizeInsuredValueController is created when the
/// CustomizeInsuredValueScreen is first loaded.
class CustomizeInsuredValueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomizeInsuredValueController());
  }
}
