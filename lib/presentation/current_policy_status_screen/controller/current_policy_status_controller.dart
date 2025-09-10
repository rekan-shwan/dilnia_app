import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/current_policy_status_screen/models/current_policy_status_model.dart';

import '../models/model_data.dart';

/// A controller class for the CurrentPolicyStatusScreen.
///
/// This class manages the state of the CurrentPolicyStatusScreen, including the
/// current currentPolicyStatusModelObj
class CurrentPolicyStatusController extends GetxController {

  List<CurrentPolicyStatusModel> currentPolicyStatusModelObj = PolicyStatusData.getPolicyStatus();
}
