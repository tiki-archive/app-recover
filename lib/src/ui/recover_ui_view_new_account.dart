/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import 'recover_ui_btn_elevated.dart';
import 'recover_ui_btn_text.dart';
import 'recover_ui_title.dart';

class RecoverUiViewNewAccount extends StatelessWidget {

  static const String _title = 'We can’t find an account on this device for ';
  static const String _opt1Txt = 'Create new account';
  static const String _opt2Txt = 'Use an existing account';

  late final String _email;
  late final RecoverService _service;

  @override
  Widget build(BuildContext context) {
    this._service = Provider.of<RecoverService>(context);
    this._email = _service.model.email!;
    return Container(
      height: MediaQuery.of(context).size.height/2,
      padding: EdgeInsets.only(top: 70, left: 20, right:20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal:30), child: RecoverUiTitle(_title + _email)),
          Padding(padding: EdgeInsets.only(bottom:40)),
          RecoverUiBtnElevated(
              text: _opt1Txt,
              callback: () => _service.controller.goToCreateNewAccount()),
          Padding(padding: EdgeInsets.only(bottom:30)),
          RecoverUiBtnText(
              text: _opt2Txt,
              callback: () => _service.controller.goToUseExistingAccount()),
        ],
      )
    );
  }
}
