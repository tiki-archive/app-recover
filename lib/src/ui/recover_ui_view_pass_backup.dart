/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import 'recover_ui_view_pass.dart';

class RecoverUiViewPassBackup extends RecoverUiViewPass {
  @override
  String get title => 'Backing up...';

  @override
  String get subtitle => 'Enter a passphrase';

  @override
  String get error => 'Invalid. Must be 8+ characters';

  @override
  void onSubmit(BuildContext context, String passphrase) {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    if (passphrase.length < 8)
      service.setError(true);
    else {
      service.setError(false);
      //TODO state logic for backup submission.
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).setError(false);
    controller.showBackupPin();
  }
}
