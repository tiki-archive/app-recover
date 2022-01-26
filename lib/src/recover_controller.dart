/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'model/recover_model_page.dart';

import 'recover_service.dart';

class RecoverController {
  final RecoverService service;

  RecoverController(this.service);

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
}
