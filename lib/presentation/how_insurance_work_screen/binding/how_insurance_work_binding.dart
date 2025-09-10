import '../controller/how_insurance_work_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HowInsuranceWorkScreen.
///
/// This class ensures that the HowInsuranceWorkController is created when the
/// HowInsuranceWorkScreen is first loaded.
class HowInsuranceWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HowInsuranceWorkController());
  }
}
