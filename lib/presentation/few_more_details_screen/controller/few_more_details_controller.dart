import 'package:flutter/material.dart';

/// A controller class for the FewMoreDetailsScreen.
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/few_more_details_screen/models/few_more_details_model.dart';

///
/// This class manages the state of the FewMoreDetailsScreen, including the
/// current fewMoreDetailsModelObj
class FewMoreDetailsController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  TextEditingController inputboxController = TextEditingController();

  Rx<FewMoreDetailsModel> fewMoreDetailsModelObj = FewMoreDetailsModel().obs;


}
