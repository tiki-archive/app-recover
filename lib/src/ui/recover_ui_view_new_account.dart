/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:recover/recover.dart';

import '../widget/recover_widget_text.dart';

class RecoverUiViewNewAccount extends StatelessWidget {
  /*final String _email = 'tiki@mytiki.com';
  final String _title = 'We can’t find an account on this device for ';
  final String _opt1Txt = 'Create New Account';
  final String _opt2Txt = 'Use an existing account';

  final Function _createNewAccount = (context) {
    RecoverController controller =
        Provider.of<RecoverService>(context).controller;
    controller.goToCreateNewAccount();
  };

  final Function _useExistingAccount = (context) {
    RecoverController controller =
        Provider.of<RecoverService>(context).controller;
    controller.goToUseExistingAccount();
  };*/

  final RecoverStyle _style;
  RecoverUiViewNewAccount(this._style);

  @override
  Widget build(BuildContext context) {
    /*return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            RecoverUiTitle(_title + _email),
            RecoverUiBtnElevated(text: _opt1Txt, callback: _createNewAccount),
            RecoverUiBtnText(text: _opt2Txt, callback: _useExistingAccount),
          ],
        ));*/
    return Container(
      height: 200,
      child: RecoverWidgetText('testing', _style),
    );
  }
}
