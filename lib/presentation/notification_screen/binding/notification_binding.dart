import '../controller/notification_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationScreen.
///
/// This class ensures that the SearchController is created when the
/// NotificationScreen is first loaded.
class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationControllers());
  }
}
