/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import 'recover_ui_view_pass.dart';

class RecoverUiViewPassBackup extends RecoverUiViewPass {
  final Logger _log = Logger('RecoverUiViewPassBackup');
  static const _error = 'Invalid. Must be 8+ characters';

  @override
  String get title => 'Backing up...';

  @override
  String get subtitle => 'Enter a passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    if (passphrase.length < 8)
      service.setError(_error);
    else {
      try {
        await service.backup(passphrase);
        service.clearError();
        controller.showSuccess();
      } on StateError catch (error) {
        service.setError(error.message);
        controller.showError();
      } catch (error) {
        _log.severe(error);
        service.setError('Weird error. Try again.');
        controller.showError();
      }
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).clearError();
    controller.showBackupPin();
  }
}
