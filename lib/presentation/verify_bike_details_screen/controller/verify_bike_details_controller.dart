import 'package:flutter/cupertino.dart';
import 'package:insurance_app/core/app_export.dart';

/// A controller class for the VerifyBikeDetailsScreen.
///
/// This class manages the state of the VerifyBikeDetailsScreen, including the
/// current verifyBikeDetailsModelObj
class VerifyBikeDetailsController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  int currentYearIndex = 0;
  int currentYear = 2023;
  String currentPolicyStatus = "Not expired";

  void setCurrentModel(String? modelName) {
    modelController.text = modelName!;
    update();
  }

  void setCurrentPolicyStatus(String? title) {
    currentPolicyStatus = title!;
    update();
  }

  void setCurrentYearIndex(index, year) {
    currentYearIndex = index;
    currentYear = year;
    dateController.text = year.toString();
    update();
  }
}
