/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recover_ui_view_pass_backup.dart';
import 'recover_ui_view_pin_cycle.dart';

import '../model/recover_model_page.dart';
import '../recover_service.dart';
import 'recover_ui_view_account.dart';
import 'recover_ui_view_backup.dart';
import 'recover_ui_view_creating.dart';
import 'recover_ui_view_cycle.dart';
import 'recover_ui_view_error.dart';
import 'recover_ui_view_lock.dart';
import 'recover_ui_view_pass_cycle.dart';
import 'recover_ui_view_pass_recover.dart';
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
        return RecoverUiViewPassRecover();
      case RecoverModelPage.locked:
        return RecoverUiViewLock();
      case RecoverModelPage.error:
        return RecoverUiViewError();
      case RecoverModelPage.cycle:
        return RecoverUiViewCycle();
      case RecoverModelPage.cyclePin:
        return RecoverUiViewPinCycle();
      case RecoverModelPage.cyclePassphrase:
        return RecoverUiViewPassCycle();
    }
  }
}
