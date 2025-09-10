import 'details_tab_container_model.dart';

class ModelData {
  static List<DetailsTabContainerModel> getPlanData() {
    return [
      DetailsTabContainerModel(
          "Comprehensive plan",
          [
            "Coveres demages to your bike",
            "Coveres demages to other’s vehicle and pro.."
          ],
          "\$123.00"),
      DetailsTabContainerModel(
          "Third party plan",
          [
            "Coveres demages to your bike",
            "Coveres demages to other’s vehicle and pro.."
          ],
          "\$144.00"),
    ];
  }
}
