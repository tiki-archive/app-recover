/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../model/recover_model_page.dart';
import '../widget/recover_widget_btn_elev.dart';
import '../widget/recover_widget_hint.dart';
import '../widget/recover_widget_title.dart';
import '../widget/recover_widget_title_error.dart';

import '../recover_service.dart';

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
               RecoverWidgetTitle(_title) :
               RecoverWidgetTitleError(_titleError)
          ),
          Padding(padding: EdgeInsets.only(bottom:40)),
          Container(padding: EdgeInsets.symmetric(horizontal:20),
            child: RecoverWidgetHint(_hint)
          ),
          Padding(padding: EdgeInsets.only(bottom:30)),
          RecoverWidgetBtnElev(
              text: _opt1Txt,
              callback: () => _service.controller.scanQrCodePermission()),
        ],
      )
    );
  }
}
