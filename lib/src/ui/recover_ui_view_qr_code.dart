/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import '../widget/recover_widget_btn_elev.dart';
import '../widget/recover_widget_text.dart';

class RecoverUiViewQrCode extends StatelessWidget {
  static const String _title = 'Open your QR code on your other device.';
  static const String _titleError = 'QR code invalid. Try again';
  static const String _hint =
      'Hint: Your QR code is in your account menu. Click the avatar in the upper left.';
  static const String _opt1Txt = 'Scan';

  @override
  Widget build(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    return Container(
        height: service.style.modalContainerHeight,
        padding: EdgeInsets.all(service.style.modalContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: service.style.textPaddingHorizontal),
                child: !service.state.isError
                    ? RecoverWidgetText(_title)
                    : RecoverWidgetText(_titleError,
                        color: service.style.errorColor)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: service.style.size(40),
                          left: service.style.size(20),
                          right: service.style.size(20)),
                      child: RecoverWidgetText(_hint,
                          color: service.style.hintColor,
                          fontStyle: FontStyle.italic)),
                  RecoverWidgetBtnElev(_opt1Txt, () {
                    /*_service.controller.goToUseExistingAccount()*/
                  })
                ]))
          ],
        ));
  }
}
