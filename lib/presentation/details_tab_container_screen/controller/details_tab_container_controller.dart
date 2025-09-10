import 'package:flutter/material.dart';

/// A controller class for the DetailsTabContainerScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/details_tab_container_screen/models/details_tab_container_model.dart';

import '../models/model_data.dart';

///
/// This class manages the state of the DetailsTabContainerScreen, including the
/// current detailsTabContainerModelObj
class DetailsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {

  int currentPlan = 1;
  int currentPlanIndex = 0;
  List<DetailsTabContainerModel> getPlan = ModelData.getPlanData();

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));

  void setCurrentPlan(int i) {
    currentPlan = i;
    update();
  }

  void setCurrentSelectedPlan(int index) {
    currentPlanIndex = index;
    update();
  }
}
