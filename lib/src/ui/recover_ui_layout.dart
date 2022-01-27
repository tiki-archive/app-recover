/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/recover_model_page.dart';
import '../recover_service.dart';
import 'recover_ui_view_creating_keys.dart';
import 'recover_ui_view_device_question.dart';
import 'recover_ui_view_new_account.dart';
import 'recover_ui_view_nice_job.dart';
import 'recover_ui_view_open_qr_code.dart';

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
        return RecoverUiViewNiceJob();
      case RecoverModelPage.openQrCode:
      case RecoverModelPage.openQrCodeError:
        return RecoverUiViewOpenQrCode();
      case RecoverModelPage.pincode:
        // TODO: Handle this case.
        return Container();
      case RecoverModelPage.passphrase:
        // TODO: Handle this case.
        return Container();
    }
  }
}
