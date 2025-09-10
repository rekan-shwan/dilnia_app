import '../controller/home_insurance_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyProfileScreen.
///
/// This class ensures that the MyProfileController is created when the
/// MyProfileScreen is first loaded.
class HomeInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeInsuranceController());
  }
}
