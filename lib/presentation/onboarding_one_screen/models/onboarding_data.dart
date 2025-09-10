import 'package:insurance_app/core/app_export.dart';

import 'onboarding_one_model.dart';

class OnboardingData {
  static List<OnboardingOneModel> getOnboardingData() {
    return [
      OnboardingOneModel(ImageConstant.imgonBoarding1stnew, "Home insurance",
          "Home insurance is also called homeowner's insurance. It safeguards your apartment."),
      OnboardingOneModel(ImageConstant.imgonBoarding2ndnew, "Car Insurance",
          "Car Insurance is effectively a contract between yourself and an insurance  you agree."),
      OnboardingOneModel(ImageConstant.imgonBoarding3rdnew, "Health insurance",
          "Health insurance is a type of insurance that covers medical expenses that to an illness."),
    ];
  }
}
