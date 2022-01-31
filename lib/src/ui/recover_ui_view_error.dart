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

class RecoverUiViewError extends RecoverUiView {
  static const String _opt1Txt = 'Try again';
  static const String _defaultMessage = 'Weird error. Try again';

  @override
  Widget page(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    return Container(
        height: style.modalContainerHeight,
        padding: EdgeInsets.all(style.modalContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: style.size(10)),
                child: RecoverWidgetText(service.state.error ?? _defaultMessage,
                    color: style.errorColor)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(bottom: style.size(30)),
                      child: Image.asset("res/images/avocado.png",
                          width: 75, package: 'recover')),
                  RecoverWidgetBtnElev(_opt1Txt, () {
                    service.clearError();
                    controller.showPrevious();
                  })
                ])),
          ],
        ));
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).clearError();
    controller.showPrevious();
  }
}
