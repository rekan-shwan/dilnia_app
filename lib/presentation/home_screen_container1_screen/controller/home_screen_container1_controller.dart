import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/home_screen_container1_screen/models/home_screen_container1_model.dart';

/// A controller class for the HomeScreenContainer1Screen.
///
/// This class manages the state of the HomeScreenContainer1Screen, including the
/// current homeScreenContainer1ModelObj
class HomeScreenContainer1Controller extends GetxController {
  Rx<HomeScreenContainer1Model> homeScreenContainer1ModelObj =
      HomeScreenContainer1Model().obs;
}
