import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

import 'controller/splash_screen_one_controller.dart';

// ignore_for_file: must_be_immutable
class SplashScreenOneScreen extends GetWidget<SplashScreenOneController> {
  const SplashScreenOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: CustomImageView(
            svgPath: ImageConstant.imgFramePrimary,
            height: getVerticalSize(
              102,
            ),
            width: getHorizontalSize(
              117,
            ),
            alignment: Alignment.center,
            margin: getMargin(
              bottom: 5,
            ),
          ),
        ),
      ),
    );
  }
}
