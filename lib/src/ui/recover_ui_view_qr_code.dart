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
import 'recover_ui_view.dart';

class RecoverUiViewQrCode extends RecoverUiView {
  static const String _title = 'Open your QR code on your other device.';
  static const String _error = 'QR code invalid. Try again';
  static const String _hint =
      'Hint: Your QR code is in your account menu. Click the avatar in the upper left.';
  static const String _opt1Txt = 'Scan';

  late final RecoverService service;

  @override
  Widget page(BuildContext context) {
    service = Provider.of<RecoverService>(context);
    return Container(
        height: style.modalContainerHeight,
        padding: EdgeInsets.all(style.modalContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: style.textPaddingHorizontal),
                child: service.state.error == null
                    ? RecoverWidgetText(_title)
                    : RecoverWidgetText(service.state.error!,
                        color: service.style.errorColor)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: style.size(40),
                          left: style.size(20),
                          right: style.size(20)),
                      child: RecoverWidgetText(_hint,
                          color: style.hintColor, fontStyle: FontStyle.italic)),
                  RecoverWidgetBtnElev(_opt1Txt, () async {
                    if (await controller.scanQr()) {
                      service.setError(_error);
                      controller.showSuccess();
                    } else
                      service.clearError();
                  })
                ]))
          ],
        ));
  }

  @override
  void back(BuildContext context) {
    service.clearError();
    controller.showRecover();
  }
}
