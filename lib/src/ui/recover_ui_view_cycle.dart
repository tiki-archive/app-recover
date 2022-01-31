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

class RecoverUiViewCycle extends RecoverUiView {
  static const String _title = 'Awesome! You restored your account.';
  static const String _hint =
      'Just one last step. We need to update your account security';
  static const String _opt1Txt = 'Continue';

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
                child: RecoverWidgetText(_title)),
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
                  RecoverWidgetBtnElev(_opt1Txt, controller.showCyclePin)
                ]))
          ],
        ));
  }

  @override
  void back(BuildContext context) => controller.showRecoverPassphrase();
}
