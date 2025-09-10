import '../controller/help_detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HelpDetailScreen.
///
/// This class ensures that the HelpDetailController is created when the
/// HelpDetailScreen is first loaded.
class HelpDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpDetailController());
  }
}
