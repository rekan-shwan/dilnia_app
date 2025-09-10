import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/review_details_screen/models/review_details_model.dart';import 'package:flutter/material.dart';/// A controller class for the ReviewDetailsScreen.
///
/// This class manages the state of the ReviewDetailsScreen, including the
/// current reviewDetailsModelObj
class ReviewDetailsController extends GetxController {TextEditingController emailController = TextEditingController();

Rx<ReviewDetailsModel> reviewDetailsModelObj = ReviewDetailsModel().obs;

@override void onClose() { super.onClose(); emailController.dispose(); } 
 }
