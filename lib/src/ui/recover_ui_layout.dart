/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../recover.dart';
import '../model/recover_model_page.dart';
import '../recover_service.dart';
import 'recover_ui_view_account.dart';

class RecoverUiLayout extends StatelessWidget {
  final RecoverStyle _style;
  RecoverUiLayout(this._style);

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
      case RecoverModelPage.account:
        return RecoverUiViewAccount(_style);
      case RecoverModelPage.creating:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.backup:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.backupPin:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.backupPassphrase:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.success:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.recover:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.qrCode:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.recoverPin:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.recoverPassphrase:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.locked:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.error:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.cycle:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.cyclePin:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.cyclePassphrase:
        // TODO: Handle this case.
        break;
    }
    throw UnimplementedError();
  }
}
