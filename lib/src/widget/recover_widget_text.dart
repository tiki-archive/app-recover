/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import '../../recover.dart';

class RecoverWidgetText extends StatelessWidget {
  final RecoverStyle _style;
  final String _text;
  final Color? _color;
  final FontStyle? _fontStyle;

  const RecoverWidgetText(this._text, this._style,
      {Color? color, FontStyle? fontStyle})
      : _color = color,
        _fontStyle = fontStyle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Text(_text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: _style.textFontWeight,
              fontSize: _style.textFontSize,
              fontFamily: _style.fontFamily,
              color: _color ?? _style.textColor,
              fontStyle: _fontStyle ?? FontStyle.normal));
    });
  }
}
