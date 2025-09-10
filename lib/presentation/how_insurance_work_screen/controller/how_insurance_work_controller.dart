import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/how_insurance_work_screen/models/how_insurance_work_model.dart';

import '../models/how_insurance_item_model.dart';

/// A controller class for the HowInsuranceWorkScreen.
///
/// This class manages the state of the HowInsuranceWorkScreen, including the
/// current howInsuranceWorkModelObj
class HowInsuranceWorkController extends GetxController {
  List<HowInsuranceItemModel>howInsuranceWork =  HowInsuranceWorkModel.howInsuranceItemList();
}
