/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../recover_style.dart';

class RecoverWidgetBtnElev extends StatelessWidget {
  final String _text;
  final RecoverStyle _style;
  final void Function() _callback;

  RecoverWidgetBtnElev(this._text, this._callback, this._style);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _callback,
      child: Text(_text,
          style: TextStyle(
            fontFamily: _style.fontFamily,
            fontWeight: _style.buttonTextWeight,
            fontSize: _style.fontSize,
            color: _style.buttonTextColor,
          )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(_style.buttonWidth, _style.buttonHeight),
        primary: _style.buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(_style.buttonRaidus))),
      ),
    );
  }
}
