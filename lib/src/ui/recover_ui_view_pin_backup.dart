/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/ui/recover_ui_view_pin.dart';

import '../recover_service.dart';

class RecoverUiViewPinBackup extends RecoverUiViewPin {
  @override
  String get title => 'Backing up...';

  @override
  String get subtitle => 'Enter a pin';

  @override
  String get error => 'Enter a pin';

  @override
  void onSubmit(BuildContext context, String pin) {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    service.setPin(pin);
    controller.showBackupPassphrase();
  }

  @override
  void back(BuildContext context) => controller.showBackup();
}
