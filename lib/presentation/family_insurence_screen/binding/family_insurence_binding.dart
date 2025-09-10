import '../controller/family_insurence_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FamilyInsurenceScreen.
///
/// This class ensures that the FamilyInsurenceController is created when the
/// FamilyInsurenceScreen is first loaded.
class FamilyInsurenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FamilyInsurenceController());
  }
}
