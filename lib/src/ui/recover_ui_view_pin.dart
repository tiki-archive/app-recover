/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../widget/recover_widget_pin.dart';

import '../recover_service.dart';
import '../widget/recover_widget_text.dart';
import 'recover_ui_view.dart';

abstract class RecoverUiViewPin extends RecoverUiView {
  @override
  Widget page(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    return Container(
        height: MediaQuery.of(context).viewInsets.bottom + style.size(200),
        padding: EdgeInsets.all(style.modalContentPadding),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RecoverWidgetText(title),
              Container(
                  padding: EdgeInsets.only(bottom: style.size(50)),
                  child: service.state.error == null
                      ? RecoverWidgetText(subtitle)
                      : RecoverWidgetText(service.state.error!,
                          color: style.errorColor)),
              RecoverWidgetPin((pin) => onSubmit(context, pin)),
            ]));
  }

  String get title;
  String get subtitle;

  void onSubmit(BuildContext context, String pin);
}
