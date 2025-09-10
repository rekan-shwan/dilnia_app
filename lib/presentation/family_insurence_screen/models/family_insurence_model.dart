import 'package:insurance_app/core/app_export.dart';

import 'family_item_model.dart';

/// This class defines the variables used in the [family_insurence_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FamilyInsurenceModel {
  static List<FamilyItemModel> getInsuranceService() {
    return [
      FamilyItemModel(ImageConstant.imgHomeIns, "lbl_home_insurance",
          appTheme.homeInsuranceBg),
      FamilyItemModel(ImageConstant.imgCarIns, "lbl_car_insurance",
          appTheme.carInsuranceBg),
      FamilyItemModel(ImageConstant.imgHealthIns, "msg_health_insurance",
          appTheme.helthInsuranceBg),
      FamilyItemModel(ImageConstant.imgTravelIns, "msg_travel_insurance",
          appTheme.travelInsuranceBg),
    ];
  }
}
