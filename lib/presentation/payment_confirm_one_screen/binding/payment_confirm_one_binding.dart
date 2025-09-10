import '../controller/payment_confirm_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentConfirmOneScreen.
///
/// This class ensures that the PaymentConfirmOneController is created when the
/// PaymentConfirmOneScreen is first loaded.
class PaymentConfirmOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentConfirmOneController());
  }
}
