import '../controller/payment_confirm_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PaymentConfirmScreen.
///
/// This class ensures that the PaymentConfirmController is created when the
/// PaymentConfirmScreen is first loaded.
class PaymentConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentConfirmController());
  }
}
