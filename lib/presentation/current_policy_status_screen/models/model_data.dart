import 'current_policy_status_model.dart';

class PolicyStatusData{
  static List<CurrentPolicyStatusModel> getPolicyStatus(){
    return [
      CurrentPolicyStatusModel("Not expired"),
      CurrentPolicyStatusModel("Expired in the last 90 days"),
      CurrentPolicyStatusModel("Expired for more then 90 days"),
    ];
  }
}