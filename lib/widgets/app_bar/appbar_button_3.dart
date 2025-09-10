import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppbarButton3 extends StatelessWidget {
  AppbarButton3({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          text: "msg_how_insurance_work".tr,
          leftIcon: Container(
            margin: getMargin(
              right: 16,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgArrowleft,
            ),
          ),
          buttonStyle: CustomButtonStyles.none.copyWith(
              fixedSize: MaterialStateProperty.all<Size>(Size(
            getHorizontalSize(
              299,
            ),
            getVerticalSize(
              34,
            ),
          ))),
          buttonTextStyle: theme.textTheme.headlineMedium!,
        ),
      ),
    );
  }
}
