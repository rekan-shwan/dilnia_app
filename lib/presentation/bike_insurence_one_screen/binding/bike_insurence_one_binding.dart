import '../controller/bike_insurence_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BikeInsurenceOneScreen.
///
/// This class ensures that the BikeInsurenceOneController is created when the
/// BikeInsurenceOneScreen is first loaded.
class BikeInsurenceOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BikeInsurenceOneController());
  }
}
