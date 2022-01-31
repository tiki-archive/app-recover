/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../recover_service.dart';
import 'recover_ui_view_pass.dart';

class RecoverUiViewPassRecover extends RecoverUiViewPass {
  static const _error = 'Incorrect passphrase. Try again';

  @override
  String get title => 'Restoring from backup...';

  @override
  String get subtitle => 'Enter your passphrase';

  @override
  Future<void> onSubmit(BuildContext context, String passphrase) async {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    if (await service.decrypt(passphrase)) {
      service.state.passphrase = passphrase;
      service.clearError();
      controller.showCycle();
    } else {
      service.setError(_error);
    }
  }

  @override
  void back(BuildContext context) {
    Provider.of<RecoverService>(context, listen: false).clearError();
    controller.showRecoverPin();
  }
}
