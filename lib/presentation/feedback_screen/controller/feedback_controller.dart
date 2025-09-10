import 'package:flutter/material.dart';

/// A controller class for the FeedbackScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/feedback_screen/models/feedback_model.dart';

///
/// This class manages the state of the FeedbackScreen, including the
/// current feedbackModelObj
class FeedbackController extends GetxController {
  TextEditingController feedbackinputController = TextEditingController();

  Rx<FeedbackModel> feedbackModelObj = FeedbackModel().obs;


}
