import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/customize_insured_value_screen/models/customize_insured_value_model.dart';/// A controller class for the CustomizeInsuredValueScreen.
///
/// This class manages the state of the CustomizeInsuredValueScreen, including the
/// current customizeInsuredValueModelObj
class CustomizeInsuredValueController extends GetxController {Rx<CustomizeInsuredValueModel> customizeInsuredValueModelObj = CustomizeInsuredValueModel().obs;

 }
