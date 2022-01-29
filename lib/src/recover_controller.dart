/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import 'model/recover_model_page.dart';
import 'recover_service.dart';

class RecoverController {
  final RecoverService _service;

  RecoverController(this._service);

  showPrevious() => _service.showPage(_service.state.previous!);
  showAccount() => _service.showPage(RecoverModelPage.account);
  showCreating() => _service.showPage(RecoverModelPage.creating);
  showBackup() => _service.showPage(RecoverModelPage.backup);
  showQrCode() => _service.showPage(RecoverModelPage.qrCode);
  showSuccess() => _service.showPage(RecoverModelPage.success);
  showRecover() => _service.showPage(RecoverModelPage.recover);

  scanQr() {}

  submitPin(RecoverModelPage page, String pin) {}

  submitPassphrase(RecoverModelPage page, String passphrase) {}

  close(BuildContext context) => Navigator.of(context).pop();

  complete(BuildContext context) {
    if (_service.onComplete != null)
      _service.onComplete!(_service.state.keys?.address);
    Navigator.of(context).pop();
  }
}
