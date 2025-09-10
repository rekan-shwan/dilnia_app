import 'package:insurance_app/core/app_export.dart';import 'package:insurance_app/presentation/help_detail_screen/models/help_detail_model.dart';/// A controller class for the HelpDetailScreen.
///
/// This class manages the state of the HelpDetailScreen, including the
/// current helpDetailModelObj
class HelpDetailController extends GetxController {Rx<HelpDetailModel> helpDetailModelObj = HelpDetailModel().obs;

 }
