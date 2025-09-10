import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: appTheme.black900.withOpacity(0.53),
      );
  static BoxDecoration get fill16 => BoxDecoration(
        color: appTheme.cyan50,
      );
  static BoxDecoration get fill15 => BoxDecoration(
        color: appTheme.indigo50,
      );
  static BoxDecoration get outline => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.03),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              -6,
            ),
          ),
        ],
      );
  static BoxDecoration get txtFill => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fill9 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fill8 => BoxDecoration(
        color: appTheme.deepOrange50,
      );
  static BoxDecoration get white => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fill5 => BoxDecoration(
        color: appTheme.deepPurple50,
      );
  static BoxDecoration get fill4 => BoxDecoration(
        color: appTheme.teal5001,
      );
  static BoxDecoration get outline1 => BoxDecoration(
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(
            1,
          ),
          strokeAlign: strokeAlignCenter,
        ),
      );
  static BoxDecoration get fill7 => BoxDecoration(
        color: appTheme.orange50,
      );
  static BoxDecoration get fill6 => BoxDecoration(
        color: appTheme.purple50,
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: appTheme.cyan100,
      );
  static BoxDecoration get fill12 => BoxDecoration(
        color: appTheme.teal50,
      );
  static BoxDecoration get fill11 => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fill3 => BoxDecoration(
        color: appTheme.green50,
      );
  static BoxDecoration get fill14 => BoxDecoration(
        color: appTheme.green5001,
      );
  static BoxDecoration get fill2 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fill13 => BoxDecoration(
        color: appTheme.purple5001,
      );
  static BoxDecoration get fill10 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillgray5010 => BoxDecoration(
        color: appTheme.gray50,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius customBorderTL24 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        24,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        24,
      ),
    ),
  );

  static BorderRadius roundedBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24,
    ),
  );

  static BorderRadius roundedBorder2 = BorderRadius.circular(
    getHorizontalSize(
      2,
    ),
  );

  static BorderRadius txtRoundedBorder11 = BorderRadius.circular(
    getHorizontalSize(
      11,
    ),
  );

  static BorderRadius txtCircleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.
    
// For Flutter SDK Version 3.7.2 or greater.
    
double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    