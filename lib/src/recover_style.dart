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

  final FontWeight _textFontWeight;
  late final double _textFontSize;
  final Color _textColor;

  RecoverStyle(
      {MediaQueryData? mediaQueryData,
      Color backgroundColor = Colors.white,
      double modalRadius = 36,
      String fontFamily = 'Arial',
      FontWeight textFontWeight = FontWeight.w600,
      double textFontSize = 18,
      Color textColor = Colors.black})
      : _textScaleFactor = mediaQueryData?.textScaleFactor ?? 1.0,
        _devicePixelRatio = mediaQueryData?.devicePixelRatio ?? 3.0,
        _backgroundColor = backgroundColor,
        _fontFamily = fontFamily,
        _textFontWeight = textFontWeight,
        _textColor = textColor {
    _modalRadius = _size(modalRadius);
    _textFontSize = _text(textFontSize);
  }

  Color get textColor => _textColor;

  double get textFontSize => _textFontSize;

  FontWeight get textFontWeight => _textFontWeight;

  String get fontFamily => _fontFamily;

  double get modalRadius => _modalRadius;

  Color get backgroundColor => _backgroundColor;

  double _size(double raw) =>
      (raw * (_devicePixelRatio / _stdDevicePixelRatio));

  double _text(double raw) =>
      (raw * (_devicePixelRatio / _stdDevicePixelRatio)) * _textScaleFactor;
}
