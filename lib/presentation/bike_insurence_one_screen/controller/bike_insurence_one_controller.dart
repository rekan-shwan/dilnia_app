import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/bike_insurence_one_screen/models/bike_insurence_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the BikeInsurenceOneScreen.
///
/// This class manages the state of the BikeInsurenceOneScreen, including the
/// current bikeInsurenceOneModelObj
class BikeInsurenceOneController extends GetxController {TextEditingController inputController = TextEditingController();

Rx<BikeInsurenceOneModel> bikeInsurenceOneModelObj = BikeInsurenceOneModel().obs;

@override void onClose() { super.onClose(); inputController.dispose(); } 
 }
