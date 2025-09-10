import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controlelr = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
                width: double.maxFinite,
                child: CustomImageView(
                    svgPath: ImageConstant.logoLarge,
                    height: getVerticalSize(512),
                    width: getHorizontalSize(720),
                    alignment: Alignment.center,
                    margin: getMargin(bottom: 5, left: 10, right: 10)))));
  }
}
