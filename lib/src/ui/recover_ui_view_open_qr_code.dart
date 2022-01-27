/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/model/recover_model_page.dart';
import 'package:recover/src/widgets/recover_ui_hint.dart';
import 'package:recover/src/widgets/recover_ui_title_error.dart';

import '../recover_service.dart';
import '../widgets/recover_ui_btn_elevated.dart';
import '../widgets/recover_ui_btn_text.dart';
import '../widgets/recover_ui_title.dart';

class RecoverUiViewOpenQrCode extends StatelessWidget {

  static const String _title = 'Open your QR code on your other device.';
  static const String _titleError = 'QR code invalid. Try again';
  static const String _hint = 'Hint: Your QR code is in your account menu. Click the avatar in the upper left.';
  static const String _opt1Txt = 'Scan';

  late final RecoverService _service;

  @override
  Widget build(BuildContext context) {
    this._service = Provider.of<RecoverService>(context);
    return Container(
      height: MediaQuery.of(context).size.height/2,
      padding: EdgeInsets.only(top: 70, left: 20, right:20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal:20),
              child: _service.state.page == RecoverModelPage.openQrCode ?
               RecoverUiTitle(_title) :
               RecoverUiTitleError(_titleError)
          ),
          Padding(padding: EdgeInsets.only(bottom:40)),
          Container(padding: EdgeInsets.symmetric(horizontal:20),
            child: RecoverUiHint(_hint)
          ),
          Padding(padding: EdgeInsets.only(bottom:30)),
          RecoverUiBtnElevated(
              text: _opt1Txt,
              callback: () => _service.controller.scanQrCodePermission()),
        ],
      )
    );
  }
}
