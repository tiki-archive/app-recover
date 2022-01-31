/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/ui/recover_ui_view_pin.dart';
import 'package:wallet/wallet.dart';

import '../recover_service.dart';

class RecoverUiViewPinRecover extends RecoverUiViewPin {
  final Logger _log = Logger('RecoverUiViewPinRecover');
  static const _error = 'Incorrect pin. Try again';

  @override
  String get title => 'Restoring from backup...';

  @override
  String get subtitle => 'Enter your pin';

  @override
  Future<void> onSubmit(BuildContext context, String pin) async {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    service.setPin(pin);
    await service.lookup(pin, (success) {
      if (success) {
        //move to passphrase
        service.clearError();
      } else
        service.setError(_error);
    }, (error) {
      if (error is StateError) {
        service.setError(error.message);
        controller.showError();
      } else if (error is TikiBkupErrorLock) {
        service.setLockCode(error.code);
        controller.showLocked();
      } else {
        _log.severe(error);
        service.setError('Weird error. Try again.');
        controller.showError();
      }
    });
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).clearError();
    controller.showRecover();
  }
}
