/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import '../widget/recover_widget_pass.dart';
import '../widget/recover_widget_text.dart';
import 'recover_ui_view.dart';

abstract class RecoverUiViewPass extends RecoverUiView {
  @override
  Widget page(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    return Container(
        height: MediaQuery.of(context).viewInsets.bottom + style.size(200),
        padding: EdgeInsets.all(style.modalContentPadding),
        child: Stack(
            children: [
        Padding(
          padding: EdgeInsets.all(style.modalContentPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RecoverWidgetText(title),
              Container(
                  padding: EdgeInsets.only(bottom: style.size(30)),
                  child: service.state.error == null
                      ? RecoverWidgetText(subtitle)
                      : RecoverWidgetText(service.state.error!,
                          color: service.style.errorColor)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: style.size(40)),
                  child: RecoverWidgetPass(
                      (passphrase) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.setLoading();
                        onSubmit(context, passphrase);
                      }),
              )])),
            if(service.state.loading) Container(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: Lottie.asset("res/animation/loading.json",
                package: 'recover',
                height: style.size(100))
              )
            )
    ]));
  }

  String get title;
  String get subtitle;

  void onSubmit(BuildContext context, String passphrase);
}
