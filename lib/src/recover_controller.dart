/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import 'model/recover_model_page.dart';
import 'recover_service.dart';

class RecoverController {
  final RecoverService _service;

  RecoverController(this._service);

  void showPrevious() => _service.showPage(_service.state.previous!);
  void showAccount() => _service.showPage(RecoverModelPage.account);
  void showCreating() => _service.showPage(RecoverModelPage.creating);
  void showBackup() => _service.showPage(RecoverModelPage.backup);
  void showQrCode() => _service.showPage(RecoverModelPage.qrCode);
  void showSuccess() => _service.showPage(RecoverModelPage.success);
  void showRecover() => _service.showPage(RecoverModelPage.recover);
  void showBackupPin() => _service.showPage(RecoverModelPage.backupPin);
  void showBackupPassphrase() =>
      _service.showPage(RecoverModelPage.backupPassphrase);
  void showRecoverPin() => _service.showPage(RecoverModelPage.recoverPin);

  Future<bool> scanQr() async {
    if (await Permission.camera.request().isGranted) {
      ScanResult result = await BarcodeScanner.scan();
      if (result.type == ResultType.Barcode) {
        List keys = result.rawContent.split(".");
        return _service.decode(keys[0], keys[1], keys[2]);
      }
    }
    return false;
  }

  submitPin(RecoverModelPage page, String pin) {}

  submitPassphrase(RecoverModelPage page, String passphrase) {}

  close(BuildContext context) => Navigator.of(context).pop();

  complete(BuildContext context) {
    if (_service.onComplete != null)
      _service.onComplete!(_service.state.keys?.address);
    Navigator.of(context).pop();
  }
}
