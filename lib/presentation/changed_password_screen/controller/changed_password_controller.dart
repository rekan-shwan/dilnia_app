import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/changed_password_screen/models/changed_password_model.dart';

/// A controller class for the ChangedPasswordScreen.
///
/// This class manages the state of the ChangedPasswordScreen, including the
/// current changedPasswordModelObj
class ChangedPasswordController extends GetxController {
  Rx<ChangedPasswordModel> changedPasswordModelObj = ChangedPasswordModel().obs;
}
