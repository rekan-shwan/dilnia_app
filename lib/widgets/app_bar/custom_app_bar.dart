// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/theme_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(left: 20, right: 20),
      child: AppBar(
        elevation: 0,
        toolbarHeight: height,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: _getStyle(),
        leadingWidth: leadingWidth ?? 0,
        leading: leading,
        title: title,
        titleSpacing: 0,
        centerTitle: centerTitle ?? false,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height,
      );

  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: getVerticalSize(
            79,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            border: Border(
              bottom: BorderSide(
                color: appTheme.gray200,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
          ),
        );
      default:
        return Container(
          height: getVerticalSize(
            79,
          ),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        );
    }
  }
}

enum Style {
  bgFill,
}
