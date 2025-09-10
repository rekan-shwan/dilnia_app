import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';
import 'package:insurance_app/widgets/base_button.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onTap,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    ButtonStyle? disabledButtonStyle,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onTap: onTap,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          disabledButtonStyle: disabledButtonStyle,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  ButtonStyle? get elevatedButtonStyle =>
      (isDisabled ?? false) ? disabledButtonStyle : buttonStyle;
  Widget get buildElevatedButtonWidget => Container(
        height: this.height,
        margin: margin,
        width: this.width,
        decoration: decoration,
        child: ElevatedButton(
          style: elevatedButtonStyle!.copyWith(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: onTap ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}

class ImageButton extends StatelessWidget {
  final VoidCallback? onTap;
  const ImageButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return // Styled Elevated Button
        ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor:
            theme.colorScheme.primary, // Fallback color for gradient
        elevation: 1,
      ).copyWith(
        textStyle: WidgetStateProperty.resolveWith((states) {
          return null;
        }),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.image, size: 24, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            "lbl_select_image".tr,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
