import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/bike_insurence_screen/models/bike_insurence_model.dart';/// A controller class for the BikeInsurenceScreen.
///
/// This class manages the state of the BikeInsurenceScreen, including the
/// current bikeInsurenceModelObj
class BikeInsurenceController extends GetxController {Rx<BikeInsurenceModel> bikeInsurenceModelObj = BikeInsurenceModel().obs;

 }
