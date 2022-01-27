/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/widgets/recover_ui_hint.dart';

import '../recover_service.dart';
import '../widgets/recover_ui_btn_elevated.dart';
import '../widgets/recover_ui_btn_text.dart';
import '../widgets/recover_ui_title.dart';

class RecoverUiViewNiceJob extends StatelessWidget {

  static const String _title = "Nice job. You're in.";
  static const String _opt1Txt = 'Close';

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
            Container(padding: EdgeInsets.symmetric(horizontal:30), child: RecoverUiTitle(_title)),
            Padding(padding: EdgeInsets.only(bottom:40)),
            Image.asset("res/images/tiki-pizza.png", width: 75, package: 'recover'),
            Padding(padding: EdgeInsets.only(bottom:30)),
            RecoverUiBtnElevated(
                text: _opt1Txt,
                callback: () => _service.controller.finish()),
          ],
        )
    );
  }
}
