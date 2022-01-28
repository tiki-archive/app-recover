/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:permission_handler/permission_handler.dart';

import 'model/recover_model_page.dart';
import 'recover_service.dart';

class RecoverController {
  final RecoverService _service;

  RecoverController(this._service);

  void goToCreateNewAccount() {
    _service.state.page = RecoverModelPage.creatingKeys;
    _service.notify();
  }

  void goToUseExistingAccount() {
    _service.state.page = RecoverModelPage.deviceQuestion;
    _service.notify();
  }

  void goToOpenQrCode() {
    _service.state.page = RecoverModelPage.openQrCode;
    _service.notify();
  }

  void goToQrCodeError() {
    _service.state.page = RecoverModelPage.openQrCodeError;
    _service.notify();
  }

  void goToNiceJob() {
    _service.state.page = RecoverModelPage.niceJob;
    _service.notify();
  }

  void goToBackupYourAccount() {
    _service.state.page = RecoverModelPage.backupYourAccount;
    _service.notify();
  }

  void goToPinCode() {
    _service.state.page = RecoverModelPage.pincode;
    _service.notify();
  }

  void goToPassphrase() {
    _service.state.page = RecoverModelPage.passphrase;
    _service.notify();
  }

  void goToLocked() {
    _service.state.page = RecoverModelPage.locked;
    _service.notify();
  }

  void goToError() {
    _service.state.page = RecoverModelPage.error;
    _service.notify();
  }

  goToBackupRecoverFlow() {}

  finish() {}

  Future<void> scanQrCodePermission() async {
    if (await Permission.camera.isGranted) {
      scanQrCode();
    } else {
      PermissionStatus result = await Permission.camera.request();
      if (result.isGranted) {
        scanQrCode();
      } else {
        // TODO no permission granted for camera
      }
    }
  }

  void scanQrCode() async {
    ScanResult result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      List keys = result.rawContent.split(".");
      if (verifyQrCode(keys)) {
        this.goToNiceJob();
      } else {
        this.goToQrCodeError();
      }
    }
  }

  bool verifyQrCode(List keys) {
    return keys.length == 3;
  }
}
