import '../controller/verify_bike_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VerifyBikeDetailsScreen.
///
/// This class ensures that the VerifyBikeDetailsController is created when the
/// VerifyBikeDetailsScreen is first loaded.
class VerifyBikeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyBikeDetailsController());
  }
}
