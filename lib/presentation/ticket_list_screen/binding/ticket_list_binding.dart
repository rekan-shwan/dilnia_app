import '../controller/ticket_list_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FeedbackScreen.
///
/// This class ensures that the FeedbackController is created when the
/// FeedbackScreen is first loaded.
class TicketListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketListController());
  }
}
