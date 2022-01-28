/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../recover.dart';
import '../recover_service.dart';

class RecoverWidgetBtnText extends StatelessWidget {
  final String _text;
  final void Function() _callback;

  RecoverWidgetBtnText(this._text, this._callback);

  @override
  Widget build(BuildContext context) {
    RecoverStyle style =
        Provider.of<RecoverService>(context, listen: false).style;
    return TextButton(
        onPressed: () => _callback,
        style: TextButton.styleFrom(
            fixedSize: Size(style.buttonWidth, style.buttonHeight)),
        child: Text(_text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: style.buttonTextWeight,
              fontSize: style.fontSize,
              fontFamily: style.fontFamily,
              color: style.buttonColor,
            )));
  }
}
