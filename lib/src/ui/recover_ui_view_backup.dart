/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import '../widget/recover_widget_btn_elev.dart';
import '../widget/recover_widget_btn_text.dart';
import '../widget/recover_widget_text.dart';

class RecoverUiViewBackup extends StatelessWidget {
  static const String _title =
      'Backup your account. We can all be a bit clumsy at times.';
  static const String _opt1Txt = 'Continue';
  static const String _opt2Txt = 'Skip (experts only)';

  @override
  Widget build(BuildContext context) {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
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
                child: RecoverWidgetText(_title)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  RecoverWidgetBtnElev(_opt1Txt, () {
                    /*_service.controller.goToBackupRecoverFlow()*/
                  }),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: service.style.size(10))),
                  RecoverWidgetBtnText(_opt2Txt, () {
                    /*_service.controller.goToNiceJob()*/
                  })
                ])),
          ],
        ));
  }
}
