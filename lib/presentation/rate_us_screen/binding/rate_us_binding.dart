import '../controller/rate_us_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RateUsScreen.
///
/// This class ensures that the RateUsController is created when the
/// RateUsScreen is first loaded.
class RateUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateUsController());
  }
}
