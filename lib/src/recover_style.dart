/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

class RecoverStyle {
  static const double _stdDeviceWidth = 375;

  final double _deviceWidth;
  final double _textScaleFactor;

  final Color _backgroundColor;
  late final double _modalRadius;
  late final double _modalContainerHeight;
  final Color _modalNavColor;
  late final double _modalNavIconSize;
  late final double _modalContentPadding;

  final String _fontFamily;
  late final double _fontSize;

  final Color _textColor;
  final FontWeight _textWeight;
  late final double _textPaddingHorizontal;

  final Color _hintColor;
  final Color _errorColor;
  final Color _titleColor;

  late final double _buttonWidth;
  late final double _buttonHeight;
  late final double _buttonRadius;
  final Color _buttonColor;
  final Color _buttonTextColor;
  final FontWeight _buttonTextWeight;

  RecoverStyle(
      {MediaQueryData? mediaQueryData,
      Color backgroundColor = Colors.white,
      double modalRadius = 36,
      double modalHeight = 349,
      Color modalNavColor = Colors.grey,
      double modalNavIconSize = 16,
      double modalContentPadding = 20,
      double textPaddingHorizontal = 20,
      String fontFamily = 'Arial',
      double fontSize = 18,
      Color textColor = Colors.black,
      Color hintColor = Colors.black26,
      Color errorColor = Colors.red,
      FontWeight textWeight = FontWeight.w600,
      double buttonWidth = 324,
      double buttonHeight = 58,
      double buttonRadius = 12,
      Color buttonColor = Colors.red,
      Color titleColor = Colors.blue,
      Color buttonTextColor = Colors.white,
      FontWeight buttonTextWeight = FontWeight.w700})
      : _textScaleFactor = mediaQueryData?.textScaleFactor ?? 1.0,
        _deviceWidth = mediaQueryData?.size.width ?? 375,
        _backgroundColor = backgroundColor,
        _modalNavColor = modalNavColor,
        _fontFamily = fontFamily,
        _textColor = textColor,
        _textWeight = textWeight,
        _hintColor = hintColor,
        _errorColor = errorColor,
        _titleColor = titleColor,
        _buttonColor = buttonColor,
        _buttonTextColor = buttonTextColor,
        _buttonTextWeight = buttonTextWeight {
    _modalRadius = size(modalRadius);
    _modalNavIconSize = size(modalNavIconSize);
    _modalContentPadding = size(modalContentPadding);
    _modalContainerHeight = size(modalHeight) - 24 - _modalNavIconSize;
    _fontSize = text(fontSize);
    _buttonWidth = size(buttonWidth);
    _buttonHeight = size(buttonHeight);
    _buttonRadius = size(buttonRadius);
    _textPaddingHorizontal = size(textPaddingHorizontal);
  }

  double size(double raw) => (raw * (_deviceWidth / _stdDeviceWidth));

  double text(double raw) =>
      (raw * (_deviceWidth / _stdDeviceWidth)) * _textScaleFactor;

  Color get backgroundColor => _backgroundColor;

  Color get modalNavColor => _modalNavColor;

  double get modalRadius => _modalRadius;

  double get modalContainerHeight => _modalContainerHeight;

  double get modalNavIconSize => _modalNavIconSize;

  String get fontFamily => _fontFamily;

  double get fontSize => _fontSize;

  Color get textColor => _textColor;

  FontWeight get textWeight => _textWeight;

  double get buttonWidth => _buttonWidth;

  double get buttonHeight => _buttonHeight;

  double get buttonRadius => _buttonRadius;

  Color get buttonColor => _buttonColor;

  Color get buttonTextColor => _buttonTextColor;

  FontWeight get buttonTextWeight => _buttonTextWeight;

  Color get hintColor => _hintColor;

  Color get errorColor => _errorColor;

  Color get titleColor => _titleColor;

  double get modalContentPadding => _modalContentPadding;

  double get textPaddingHorizontal => _textPaddingHorizontal;
}
