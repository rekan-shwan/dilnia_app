import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/family_insurence_screen/models/family_insurence_model.dart';

import '../models/family_item_model.dart';

/// A controller class for the FamilyInsurenceScreen.
///
/// This class manages the state of the FamilyInsurenceScreen, including the
/// current familyInsurenceModelObj
class FamilyInsurenceController extends GetxController {
  // Rx<FamilyInsurenceModel> familyInsurenceModelObj = FamilyInsurenceModel().obs;

  List<FamilyItemModel> familyInsurenceModelObj  = FamilyInsurenceModel.getInsuranceService();

}
