/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

class RecoverStyle {
  final Color backgroundColor;
  final double modalRadius;

  final String fontFamily;

  final FontWeight textFontWeight;
  final double textFontSize;
  final Color textColor;

  const RecoverStyle(
      {this.backgroundColor = Colors.white,
      this.modalRadius = 6,
      this.fontFamily = 'Arial',
      this.textFontWeight = FontWeight.w600,
      this.textFontSize = 18,
      this.textColor = Colors.black});
}
