import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppbarButton4 extends StatelessWidget {
  AppbarButton4({
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
          text: "lbl_blog".tr,
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
              98,
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
