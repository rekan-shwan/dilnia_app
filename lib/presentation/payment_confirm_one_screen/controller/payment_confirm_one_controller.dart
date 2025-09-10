import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/payment_confirm_one_screen/models/payment_confirm_one_model.dart';

/// A controller class for the PaymentConfirmOneScreen.
///
/// This class manages the state of the PaymentConfirmOneScreen, including the
/// current paymentConfirmOneModelObj
class PaymentConfirmOneController extends GetxController {
  Rx<PaymentConfirmOneModel> paymentConfirmOneModelObj =
      PaymentConfirmOneModel().obs;
  List<String?> arguments = Get.arguments;
  var paymentStatus = ''.obs;
  var invoiceData = ''.obs;
  @override
  void onInit() {
    paymentStatus.value = arguments[0] ?? '';
    invoiceData.value = arguments[1] ?? '';
    super.onInit();
  }
}
