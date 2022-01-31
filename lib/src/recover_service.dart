/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';
import 'package:wallet/wallet.dart';

import 'model/recover_model_page.dart';
import 'model/recover_model_state.dart';
import 'recover_controller.dart';
import 'recover_presenter.dart';
import 'recover_style.dart';

class RecoverService extends ChangeNotifier {
  final Logger _log = Logger('RecoverService');
  final RecoverModelState state;
  final RecoverStyle style;
  final TikiKeysService _keysService;
  final TikiBkupService _bkupService;
  final void Function(String?)? onComplete;
  late final RecoverPresenter presenter;
  late final RecoverController controller;

  RecoverService(this.state, this.style,
      {FlutterSecureStorage? secureStorage,
      Httpp? httpp,
      this.onComplete,
      Future<String> Function()? onUnauthorized})
      : _keysService = TikiKeysService(secureStorage: secureStorage),
        _bkupService =
            TikiBkupService(httpp: httpp, onUnauthorized: onUnauthorized) {
    presenter = RecoverPresenter(this, style);
    controller = RecoverController(this);
  }

  void showPage(RecoverModelPage page) {
    state.previous = state.page;
    state.page = page;
    notifyListeners();
  }

  void setError(String? error) {
    state.error = error;
    notifyListeners();
  }

  void clearError() {
    state.error = null;
    notifyListeners();
  }

  void setLockCode(String? code) {
    state.lockCode = code;
    notifyListeners();
  }

  void setPin(String pin) {
    state.pin = pin;
    notifyListeners();
  }

  void setNewPin(String newPin) {
    state.newPin = newPin;
    notifyListeners();
  }

  void setPassphrase(String passphrase) {
    state.passphrase = passphrase;
    notifyListeners();
  }

  Future<bool> decode(String address, String data, String sign) async {
    if (address.length != 44 || data.length != 44 || sign.length != 1624)
      return false;
    else {
      try {
        state.keys = TikiKeysModel.decode(address, sign, data);
        await _keysService.provide(state.keys!);
        notifyListeners();
        return true;
      } catch (error) {
        _log.warning(error);
        return false;
      }
    }
  }

  Future<bool> decrypt(String passphrase) async {
    state.keys = await _keysService.decrypt(passphrase, state.ciphertext!);
    if (state.keys == null)
      return false;
    else {
      await _keysService.provide(state.keys!);
      return true;
    }
  }

  Future<void> lookup(
          String pin, Function(bool) onComplete, Function(Error) onError) =>
      _bkupService.recover(
          email: state.email!,
          accessToken: state.accessToken!,
          pin: pin,
          onError: (error) => onError(_mapError(error)),
          onSuccess: (ciphertext) {
            if (ciphertext != null) {
              state.ciphertext = ciphertext;
              notifyListeners();
              onComplete(true);
            } else
              onComplete(false);
          });

  Future<void> cycle(
      String passphrase, Function() onSuccess, Function(Error) onError) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.cycle(
        email: state.email!,
        accessToken: state.accessToken!,
        oldPin: state.pin!,
        newPin: state.newPin!,
        ciphertext: ciphertext,
        onError: (error) => onError(_mapError(error)),
        onSuccess: onSuccess);
  }

  Future<void> backup(
      String passphrase, Function() onSuccess, Function(Error) onError) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.backup(
        email: state.email!,
        accessToken: state.accessToken!,
        pin: state.pin!,
        ciphertext: ciphertext,
        onError: (error) => onError(_mapError(error)),
        onSuccess: onSuccess);
  }

  Future<void> generate() async {
    state.keys = await _keysService.generate();
    notifyListeners();
  }

  Error _mapError(error) {
    if (error is TikiBkupErrorLock)
      return error;
    else if (error is SocketException)
      return StateError('No internet. Try again');
    else
      return StateError('Weird error. Try again');
  }

  void setLoading() {
    state.loading = true;
    notifyListeners();
  }

  void finishLoading() {
    state.loading = false;
  }
}
