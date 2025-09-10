import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/rate_us_screen/models/rate_us_model.dart';

/// A controller class for the RateUsScreen.
///
/// This class manages the state of the RateUsScreen, including the
/// current rateUsModelObj
class RateUsController extends GetxController {
  Rx<RateUsModel> rateUsModelObj = RateUsModel().obs;
}
