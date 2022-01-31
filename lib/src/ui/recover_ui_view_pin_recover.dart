/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/ui/recover_ui_view_pin.dart';

import '../recover_service.dart';

class RecoverUiViewPinRecover extends RecoverUiViewPin {
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
    try {
      if (await service.lookup(pin)) {
        //move to passphrase
        service.clearError();
      } else
        service.setError(_error);
    } on StateError catch (error) {
      service.setError(error.message);
      controller.showError();
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).clearError();
    controller.showRecover();
  }
}
