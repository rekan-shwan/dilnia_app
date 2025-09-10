import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: getFontSize(
          16,
        ),
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMedium17 => theme.textTheme.titleMedium!.copyWith(
        fontSize: getFontSize(
          17,
        ),
      );
  static get titleMedium17width400 => theme.textTheme.titleMedium!.copyWith(
        fontSize: getFontSize(
          17,
        ),
    fontWeight: FontWeight.w400,
    color: appTheme.buttonColor
      );
  static get titleMedium17width400black => theme.textTheme.titleMedium!.copyWith(
        fontSize: getFontSize(
          17,
        ),
    fontWeight: FontWeight.w400,
    color: appTheme.black900
      );
  static get titleLargeBold_1 => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumSemiBold17 => theme.textTheme.titleMedium!.copyWith(
        fontSize: getFontSize(
          17,
        ),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontSize: getFontSize(
          22,
        ),
        fontWeight: FontWeight.w700,
      );

  static get title => theme.textTheme.titleLarge!.sFProDisplay.copyWith(
        fontSize: getFontSize(
          13,
        ),
        color: appTheme.gray600,
        fontWeight: FontWeight.w400,
      );
  static get dayStyle => theme.textTheme.titleLarge!.sFProDisplay.copyWith(
        fontSize: getFontSize(
          20,
        ),
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontSize: getFontSize(
          15,
        ),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumSemiBold_1 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static get skipTextWhiteA700 => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w400,
        fontSize: getFontSize(17),
        color: appTheme.whiteA700,
      );
  // Body text style
  static get bodyMediumRed400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red400,
      );
  static get bodyMediumRed700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red700,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: getFontSize(
          16,
        ),
      );
  static get bodyLargeBlack => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          16,
        ),
      );

  static get bodyLargeRed => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.red700,
        fontSize: getFontSize(
          14,
        ),
      );
  static get bodyLargeSFUIText_1 => theme.textTheme.bodyLarge!.sFUIText;
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );

  static get bodyMediumSecondaryContainerRed =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red700,
      );
  static get bodyLargeBlack900_2 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.42),
      );
  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.49),
      );
  static get bodyLargeGray600_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: getFontSize(
          13,
        ),
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.56),
      );
  static get bodyLargeSFUIText => theme.textTheme.bodyLarge!.sFUIText;
  static get bodyLarge16 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: getFontSize(
          16,
        ),
      );
  static get bold => theme.textTheme.bodyLarge!.sFProDisplay.copyWith(
        fontSize: getFontSize(
          18,
        ),
    color: appTheme.black900,
    fontWeight: FontWeight.w700
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: getFontSize(
          13,
        ),
      );
  // Headline text style
  static get headlineMediumWhiteA700 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get sFUIText {
    return copyWith(
      fontFamily: 'SF UI Text',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
