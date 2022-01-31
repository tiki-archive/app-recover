/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/ui/recover_ui_view_pass_backup.dart';

import '../model/recover_model_page.dart';
import '../recover_service.dart';
import 'recover_ui_view_account.dart';
import 'recover_ui_view_backup.dart';
import 'recover_ui_view_creating.dart';
import 'recover_ui_view_error.dart';
import 'recover_ui_view_pin_backup.dart';
import 'recover_ui_view_pin_recover.dart';
import 'recover_ui_view_qr_code.dart';
import 'recover_ui_view_recover.dart';
import 'recover_ui_view_success.dart';

class RecoverUiLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    switch (service.state.page) {
      case RecoverModelPage.account:
        return RecoverUiViewAccount();
      case RecoverModelPage.creating:
        return RecoverUiViewCreating();
      case RecoverModelPage.backup:
        return RecoverUiViewBackup();
      case RecoverModelPage.backupPin:
        return RecoverUiViewPinBackup();
      case RecoverModelPage.backupPassphrase:
        return RecoverUiViewPassBackup();
      case RecoverModelPage.success:
        return RecoverUiViewSuccess();
      case RecoverModelPage.recover:
        return RecoverUiViewRecover();
      case RecoverModelPage.qrCode:
        return RecoverUiViewQrCode();
      case RecoverModelPage.recoverPin:
        return RecoverUiViewPinRecover();
      case RecoverModelPage.recoverPassphrase:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.locked:
        // TODO: Handle this case.
        break;
      case RecoverModelPage.error:
        return RecoverUiViewError();
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
