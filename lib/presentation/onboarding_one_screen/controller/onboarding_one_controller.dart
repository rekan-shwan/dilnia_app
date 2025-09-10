import 'package:flutter/cupertino.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/onboarding_one_screen/models/onboarding_one_model.dart';

import '../models/onboarding_data.dart';

/// A controller class for the OnboardingOneScreen.
///
/// This class manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj
class OnboardingOneController extends GetxController {
 PageController pageControlelr = PageController();
 List<OnboardingOneModel> onboardingData = OnboardingData.getOnboardingData();
 Rx<int> sliderIndex = 0.obs;
 int currentPage = 0;

 void setCurrentPage(int value) {
  currentPage = value;
  update();
 }
}
