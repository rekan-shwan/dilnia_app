import 'package:flutter/material.dart';

/// A controller class for the ChooseBikeModelScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/choose_bike_model_screen/models/choose_bike_model_model.dart';

import '../models/model_data.dart';

///
/// This class manages the state of the ChooseBikeModelScreen, including the
/// current chooseBikeModelModelObj
class ChooseBikeModelController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ChooseBikeModelModel> getModelData = BikeModelData.getModelName();
int currentModelIndex = 0;
  void setCurrentModel(int index) {
    currentModelIndex = index;
    update();
  }


}
