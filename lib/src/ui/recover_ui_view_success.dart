/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/widget/recover_widget_btn_elev.dart';

import '../recover_service.dart';
import '../widget/recover_widget_text.dart';

class RecoverUiViewSuccess extends StatelessWidget {
  static const String _title = "Nice job. You're in.";
  static const String _opt1Txt = 'Close';

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
                padding: EdgeInsets.only(bottom: service.style.size(10)),
                child: RecoverWidgetText(_title)),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      padding: EdgeInsets.only(bottom: service.style.size(30)),
                      child: Image.asset("res/images/tiki-pizza.png",
                          width: 75, package: 'recover')),
                  RecoverWidgetBtnElev(_opt1Txt, () {
                    /*=> _service.controller.finish()*/
                  })
                ])),
          ],
        ));
  }
}
