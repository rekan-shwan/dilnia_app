import 'package:insurance_app/core/app_export.dart';

import 'how_insurance_item_model.dart';

/// This class defines the variables used in the [how_insurance_work_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HowInsuranceWorkModel {
  // Rx<List<HowInsuranceItemModel>> howInsuranceItemList =
  //     Rx(List.generate(3, (index) => HowInsuranceItemModel()));

  static List<HowInsuranceItemModel> howInsuranceItemList() {
    return [
      HowInsuranceItemModel(
          ImageConstant.imgHowInsuranceWork1st,
          "Are you car accident a road the cross hiway?",
          "Be ready with health insurance for your car the cross insurance."),
      HowInsuranceItemModel(
          ImageConstant.imgHowInsuranceWork2nd,
          "What is a hospital and types of hospital?",
          "They typically have a large staff of doctors and nurses, as  Another common type of hospital."),
      HowInsuranceItemModel(
          ImageConstant.imgHowInsuranceWork3rd,
          "Which insurance is best for my child?",
          "On maturity, these plans pay a lump sum amount which can be used to pay your child's college."),
    ];
  }
}
