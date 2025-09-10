import '../controller/car_insurance_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeInsuranceScreen.
///
/// This class ensures that the HomeInsuranceDetailsController is created when the
/// HomeInsuranceScreen is first loaded.
class CarInsuranceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CarInsuranceDetailsController());
  }
}
