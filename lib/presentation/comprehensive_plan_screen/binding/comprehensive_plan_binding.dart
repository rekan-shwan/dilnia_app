import '../controller/comprehensive_plan_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ComprehensivePlanScreen.
///
/// This class ensures that the ComprehensivePlanController is created when the
/// ComprehensivePlanScreen is first loaded.
class ComprehensivePlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComprehensivePlanController());
  }
}
