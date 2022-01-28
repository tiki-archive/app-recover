/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

class RecoverStyle {
  static const double _stdDevicePixelRatio = 3.0;

  final double _devicePixelRatio;
  final double _textScaleFactor;
  final Color _backgroundColor;
  late final double _modalRadius;

  final String _fontFamily;
  late final double _fontSize;

  final Color _textColor;
  final FontWeight _textWeight;

  final Color _hintColor;
  final Color _errorColor;
  final Color _titleColor;
  late final double _titleSize;


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
      String fontFamily = 'Arial',
      double fontSize = 18,
      double titleSize = 20,
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
        _devicePixelRatio = mediaQueryData?.devicePixelRatio ?? 3.0,
        _backgroundColor = backgroundColor,
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
    _fontSize = text(fontSize);
    _buttonWidth = size(buttonWidth);
    _buttonHeight = size(buttonHeight);
    _buttonRadius = size(buttonRadius);
    _titleSize = text(titleSize);
  }

  double size(double raw) => (raw * (_devicePixelRatio / _stdDevicePixelRatio));

  double text(double raw) =>
      (raw * (_devicePixelRatio / _stdDevicePixelRatio)) * _textScaleFactor;

  Color get backgroundColor => _backgroundColor;

  double get modalRadius => _modalRadius;

  String get fontFamily => _fontFamily;

  double get fontSize => _fontSize;

  double get titleSize => _titleSize;

  Color get textColor => _textColor;

  FontWeight get textWeight => _textWeight;

  double get buttonWidth => _buttonWidth;

  double get buttonHeight => _buttonHeight;

  double get buttonRaidus => _buttonRadius;

  Color get buttonColor => _buttonColor;

  Color get buttonTextColor => _buttonTextColor;

  FontWeight get buttonTextWeight => _buttonTextWeight;

  Color get hintColor => _hintColor;

  Color get errorColor => _errorColor;

  Color get titleColor => _titleColor;
}
