/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/recover_model_page.dart';
import '../recover_service.dart';
import 'recover_ui_view_creating_keys.dart';
import 'recover_ui_view_new_account.dart';

class RecoverUiLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    return Container(
        child: _page(service.state.page)
    );
  }

  Widget _page(RecoverModelPage page) {
    switch (page) {
      case RecoverModelPage.creatingKeys:
        return RecoverUiViewCreatingKeys();
      case RecoverModelPage.newAccount:
        return RecoverUiViewNewAccount();
      case RecoverModelPage.backupYourAccount:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.deviceQuestion:
        return RecoverUiViewDeviceQuestion();
      case RecoverModelPage.error:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.locked:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.niceJob:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.openQrCode:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.pincode:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.passphrase:
        // TODO: Handle this case.
        return Container();
    }
  }
}
