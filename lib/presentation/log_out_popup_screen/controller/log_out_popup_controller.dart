

import 'package:get/get.dart';

import '../models/log_out_popup_model.dart';

/// A controller class for the LogOutPopupScreen.
///
/// This class manages the state of the LogOutPopupScreen, including the
/// current logOutPopupModelObj
class LogOutPopupController extends GetxController {
  Rx<LogOutPopupModel> logOutPopupModelObj = LogOutPopupModel().obs;
}
