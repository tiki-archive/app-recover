/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:recover/src/model/recover_model_page.dart';

import 'recover_service.dart';

class RecoverController {
  final RecoverService _service;

  RecoverController(this._service);

  showAccount() => _service.showPage(RecoverModelPage.account);
  showCreating() => _service.showPage(RecoverModelPage.creating);
  showBackup() => _service.showPage(RecoverModelPage.backup);
  showBackupPin() => _service.showPage(RecoverModelPage.backupPin);
  showBackupPassphrase() =>
      _service.showPage(RecoverModelPage.backupPassphrase);
  showSuccess() => _service.showPage(RecoverModelPage.success);
  showRecover() => _service.showPage(RecoverModelPage.recover);
  showQrCode() => _service.showPage(RecoverModelPage.qrCode);
  showRecoverPin() => _service.showPage(RecoverModelPage.recoverPin);
  showRecoverPassphrase() =>
      _service.showPage(RecoverModelPage.recoverPassphrase);
  showLocked() => _service.showPage(RecoverModelPage.locked);
  showError() => _service.showPage(RecoverModelPage.error);
  showCycle() => _service.showPage(RecoverModelPage.cycle);
  showCyclePin() => _service.showPage(RecoverModelPage.cyclePin);
  showCyclePassphrase() => _service.showPage(RecoverModelPage.cyclePassphrase);

  scanQr() {}

  submitPin(RecoverModelPage page, String pin) {}

  submitPassphrase(RecoverModelPage page, String passphrase) {}

  close() {}
}
