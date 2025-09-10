// ignore_for_file: must_be_immutable

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.fillColor,
    this.filled = false,
    this.contentPadding,
    this.defaultBorderDecoration,
    this.enabledBorderDecoration,
    this.focusedBorderDecoration,
    this.disabledBorderDecoration,
    this.validator,
    this.onTap,
    this.isCurrency = false,
    this.elevation = 0,
    this.shadowColor,
    this.hoverColor,
    this.focusColor,
    this.borderRadius,
    this.enableAnimation = true,
    this.scaleOnFocus = 1.02,
  }) : super(key: key);

  final Alignment? alignment;
  final bool isCurrency;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final Color? fillColor;
  final bool? filled;
  final EdgeInsets? contentPadding;
  final InputBorder? defaultBorderDecoration;
  final InputBorder? enabledBorderDecoration;
  final InputBorder? focusedBorderDecoration;
  final InputBorder? disabledBorderDecoration;
  final FormFieldValidator<String>? validator;
  final Function? onTap;

  // New advanced properties
  final double elevation; // Shadow elevation
  final Color? shadowColor; // Shadow color
  final Color? hoverColor; // Color when hovered
  final Color? focusColor; // Color when focused
  final BorderRadius? borderRadius; // Custom border radius
  final bool enableAnimation; // Enable/disable focus animation
  final double scaleOnFocus; // Scale factor when focused

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.black.withOpacity(0.1),
                  blurRadius: elevation * 2,
                  spreadRadius: elevation * 0.5,
                  offset: Offset(0, elevation),
                )
              ]
            : null,
      ),
      child: AnimatedScale(
        duration: enableAnimation ? Duration(milliseconds: 200) : Duration.zero,
        scale: _isFocused ? scaleOnFocus : 1.0,
        child: TextFormField(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          controller: controller,
          inputFormatters: isCurrency
              ? [
                  CurrencyTextInputFormatter.currency(
                      locale: 'ar_IQ', decimalDigits: 0, symbol: curencySymbol)
                ]
              : [],
          focusNode: focusNode,
          autofocus: autofocus ?? true,
          style: textStyle ?? CustomTextStyles.bodyLargeBlack,
          obscureText: obscureText ?? false,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      ),
    );
  }

  bool get _isFocused {
    return focusNode?.hasFocus ?? false;
  }

  InputDecoration get decoration => InputDecoration(
        errorStyle: CustomTextStyles.bodyLargeRed,
        hintText: hintText ?? "",
        hintStyle: hintStyle ??
            TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
        prefixIcon: prefix != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: prefix,
              )
            : null,
        prefixIconConstraints: prefixConstraints ??
            BoxConstraints(
              maxHeight: 48,
              minHeight: 48,
            ),
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 12),
                child: suffix,
              )
            : null,
        suffixIconConstraints: suffixConstraints ??
            BoxConstraints(
              maxHeight: 48,
              minHeight: 48,
            ),
        fillColor: _isFocused
            ? focusColor ?? (fillColor ?? Colors.grey.shade100).withOpacity(0.9)
            : fillColor ?? Colors.grey.shade100,
        filled: filled ?? true,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide(
            color: const Color(0XFF263B80).withOpacity(0.8),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hoverColor: hoverColor ?? Colors.grey.shade200,
      );
}

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineRed700 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(16.00),
        ),
        borderSide: BorderSide(
          color: appTheme.red700,
          width: 1,
        ),
      );

  static OutlineInputBorder get fillGray100 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(16.00),
        ),
        borderSide: BorderSide.none,
      );
}
