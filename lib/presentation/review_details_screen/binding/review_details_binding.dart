import '../controller/review_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ReviewDetailsScreen.
///
/// This class ensures that the ReviewDetailsController is created when the
/// ReviewDetailsScreen is first loaded.
class ReviewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewDetailsController());
  }
}
