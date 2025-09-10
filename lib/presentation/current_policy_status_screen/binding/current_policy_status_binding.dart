import '../controller/current_policy_status_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CurrentPolicyStatusScreen.
///
/// This class ensures that the CurrentPolicyStatusController is created when the
/// CurrentPolicyStatusScreen is first loaded.
class CurrentPolicyStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurrentPolicyStatusController());
  }
}
