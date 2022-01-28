/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/recover_service.dart';

import '../recover_style.dart';

class RecoverWidgetBtnElev extends StatelessWidget {
  final String _text;
  late final RecoverStyle _style;
  final void Function() _callback;

  RecoverWidgetBtnElev({required text, required callback}) :
    _text = text,
    _callback = callback;

  @override
  Widget build(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    _style = service.model.style;
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
