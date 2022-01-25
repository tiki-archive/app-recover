/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/recover_model_page.dart';
import '../recover_service.dart';
import 'recover_ui_view_new_account.dart';

class RecoverUiLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    return Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      //KeysModalViewHeader(),
      Container(
        padding: EdgeInsets.only(left: 6, right: 6, bottom: 5),
        child: _page(service.state.page),
      )
    ]));
  }

  Widget _page(RecoverModelPage page) {
    switch (page) {
      case RecoverModelPage.newAccount:
        return RecoverUiViewNewAccount();
    }
  }
}
