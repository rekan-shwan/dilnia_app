import '../controller/bike_insurence_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BikeInsurenceScreen.
///
/// This class ensures that the BikeInsurenceController is created when the
/// BikeInsurenceScreen is first loaded.
class BikeInsurenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BikeInsurenceController());
  }
}
