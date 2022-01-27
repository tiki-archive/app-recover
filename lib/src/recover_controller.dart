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
    service.state.page = RecoverModelPage.creatingKeys;
    this.service.notify();
  }

  void goToUseExistingAccount() {
    service.state.page = RecoverModelPage.deviceQuestion;
    this.service.notify();
  }

  void goToOpenQrCode(){
    service.state.page = RecoverModelPage.openQrCode;
    this.service.notify();
  }


  void goToQrCodeError() {
    service.state.page = RecoverModelPage.openQrCodeError;
    this.service.notify();
  }

  void goToNiceJob(){
    service.state.page = RecoverModelPage.niceJob;
    this.service.notify();
  }

  void goToBackupYourAccount(){
    service.state.page = RecoverModelPage.backupYourAccount;
    this.service.notify();
  }

  void goToPinCode(){
    service.state.page = RecoverModelPage.pincode;
    this.service.notify();
  }

  void goToPassphrase(){
    service.state.page = RecoverModelPage.passphrase;
    this.service.notify();
  }

  void goToLocked(){
    service.state.page = RecoverModelPage.locked;
    service.notify();
  }

  void goToError(){
    service.state.page = RecoverModelPage.error;
    service.notify();
  }

  goToBackupRecoverFlow() {}

  finish() {}

  Future<void> scanQrCodePermission() async {
    if (await Permission.camera.isGranted) {
      scanQrCode();
    }else{
      PermissionStatus result = await Permission.camera.request();
      if (result.isGranted) {
        scanQrCode();
      }else{
        // TODO no permission granted for camera
      }
    }
  }

  void scanQrCode() async {
    ScanResult result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      List keys = result.rawContent.split(".");
      if(verifyQrCode(keys)){
        this.goToNiceJob();
      }else{
        this.goToQrCodeError();
      }
    }
  }


  bool verifyQrCode(List keys) {
    return keys.length == 3;
  }

}
