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

class RecoverUiViewLock extends RecoverUiView {
  static const String _opt1Txt = 'Contact support';
  static const String _title =
      'Too many attempts. Your account has been locked.';
  static const String _code = 'Give support this code:';

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
                child:
                    RecoverWidgetText(_title, color: service.style.errorColor)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  RecoverWidgetText(_code,
                      color: style.hintColor, fontStyle: FontStyle.italic),
                  Container(
                      padding: EdgeInsets.only(
                          left: style.size(10),
                          right: style.size(10),
                          bottom: style.size(40)),
                      child: RecoverWidgetText(service.state.lockCode ?? '',
                          color: style.hintColor, fontStyle: FontStyle.italic)),
                  RecoverWidgetBtnElev(_opt1Txt,
                      () => controller.contactSupport(service.state.lockCode))
                ]))
          ],
        ));
  }

  @override
  void back(BuildContext context) {
    service.clearError();
    controller.showPrevious();
  }
}
