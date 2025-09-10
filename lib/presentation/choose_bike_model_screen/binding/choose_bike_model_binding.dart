import '../controller/choose_bike_model_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseBikeModelScreen.
///
/// This class ensures that the ChooseBikeModelController is created when the
/// ChooseBikeModelScreen is first loaded.
class ChooseBikeModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseBikeModelController());
  }
}
