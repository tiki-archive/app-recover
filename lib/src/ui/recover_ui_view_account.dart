/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import '../widget/recover_widget_btn_elev.dart';
import '../widget/recover_widget_btn_text.dart';
import '../widget/recover_widget_text.dart';

class RecoverUiViewAccount extends StatelessWidget {
  static const String _title = 'We can’t find an account on this device for ';
  static const String _opt1Txt = 'Create new account';
  static const String _opt2Txt = 'Use an existing account';

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
                  child:
                      RecoverWidgetText(_title + (service.state.email ?? ''))),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    RecoverWidgetBtnElev(_opt1Txt, () {
                      /*service.controller.goToCreateNewAccount()*/
                    }),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: service.style.size(10))),
                    RecoverWidgetBtnText(_opt2Txt, () {
                      /*_service.controller.goToUseExistingAccount()*/
                    })
                  ]))
            ]));
  }
}
