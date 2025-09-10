import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/comprehensive_plan_screen/models/comprehensive_plan_model.dart';/// A controller class for the ComprehensivePlanScreen.
///
/// This class manages the state of the ComprehensivePlanScreen, including the
/// current comprehensivePlanModelObj
class ComprehensivePlanController extends GetxController {Rx<ComprehensivePlanModel> comprehensivePlanModelObj = ComprehensivePlanModel().obs;

Rx<bool> isCheckbox = false.obs;

Rx<bool> isCheckbox1 = false.obs;

 }
