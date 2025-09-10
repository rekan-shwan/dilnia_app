import 'package:get/get.dart';

import '../controller/medical_insurance_details_controller.dart';

/// A binding class for the HomeInsuranceScreen.
///
/// This class ensures that the HomeInsuranceDetailsController is created when the
/// HomeInsuranceScreen is first loaded.
class MedicalInsuranceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalInsuranceDetailsController());
  }
}
