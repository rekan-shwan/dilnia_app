import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/payment_confirm_screen/models/payment_confirm_model.dart';

import '../models/list_item_model.dart';

/// A controller class for the PaymentConfirmScreen.
///
/// This class manages the state of the PaymentConfirmScreen, including the
/// current paymentConfirmModelObj
class PaymentConfirmController extends GetxController {



  List<ListItemModel> paymentConfirmModelObj = PaymentConfirmModel.getMessegeList();
}
