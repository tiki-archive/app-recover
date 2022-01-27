/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../../recover.dart';

class RecoverWidgetBtnText extends StatelessWidget {
  final String _text;
  final RecoverStyle _style;
  final void Function() _callback;

  RecoverWidgetBtnText(this._text, this._style, this._callback);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => _callback,
        style: TextButton.styleFrom(
            fixedSize: Size(_style.buttonWidth, _style.buttonHeight)),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: _style.buttonTextWeight,
              fontSize: _style.fontSize,
              fontFamily: _style.fontFamily,
              color: _style.buttonColor,
            )));
  }
}
