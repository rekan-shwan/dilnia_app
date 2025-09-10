import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/presentation/login_active_screen/models/login_active_model.dart';
import 'package:flutter/material.dart';

/// This class manages the state of the LoginActiveScreen, including the
/// current loginActiveModelObj
class LoginActiveController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController group1859Controller = TextEditingController();

  Rx<LoginActiveModel> loginActiveModelObj = LoginActiveModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    group1859Controller.dispose();
  }
}
