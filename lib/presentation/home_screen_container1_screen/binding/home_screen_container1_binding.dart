import '../controller/home_screen_container1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeScreenContainer1Screen.
///
/// This class ensures that the HomeScreenContainer1Controller is created when the
/// HomeScreenContainer1Screen is first loaded.
class HomeScreenContainer1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenContainer1Controller());
  }
}
