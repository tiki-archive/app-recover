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
  @override
  String get title => 'Restoring from backup...';

  @override
  String get subtitle => 'Enter your pin';

  @override
  String get error => 'Incorrect pin. Try again';

  @override
  Future<void> onSubmit(BuildContext context, String pin) async {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    service.setPin(pin);
    if (await service.lookup(pin)) {
      //move to passphrase
      service.setError(false);
    } else
      service.setError(true);
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).setError(false);
    controller.showRecover();
  }
}
