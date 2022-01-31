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
  final Future<String> Function()? onUnauthorized;
  late final RecoverPresenter presenter;
  late final RecoverController controller;

  RecoverService(this.state, this.style,
      {FlutterSecureStorage? secureStorage,
      Httpp? httpp,
      this.onComplete,
      this.onUnauthorized})
      : _keysService = TikiKeysService(secureStorage: secureStorage),
        _bkupService = TikiBkupService(httpp: httpp) {
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

  /*Future<void> decrypt(String passphrase) async {
    state.keys = await _keysService.decrypt(passphrase, state.ciphertext!);
    if (state.keys == null) {
      // invalid passphrase
    }
    return _keysService.provide(state.keys!);
  }*/

  Future<bool> lookup(String pin) async {
    bool success = false;
    await _bkupService.recover(
        email: state.email!,
        accessToken: state.accessToken!,
        pin: pin,
        onError: (error) => _handleError(error, () async {
              success = await lookup(pin);
            }),
        onSuccess: (ciphertext) {
          if (ciphertext != null) {
            state.ciphertext = ciphertext;
            success = true;
            notifyListeners();
          }
        });
    return success;
  }

  /*Future<void> cycle(String passphrase) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.cycle(
        email: state.email!,
        accessToken: state.accessToken!,
        oldPin: state.pin!,
        newPin: state.newPin!,
        ciphertext: ciphertext,
        onError: (error) {
          //misc error
        },
        onSuccess: () {
          //cycle worked
        });
  }
*/

  Future<void> backup(String passphrase) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.backup(
        email: state.email!,
        accessToken: state.accessToken!,
        pin: state.pin!,
        ciphertext: ciphertext,
        onError: (error) => _handleError(error, () async {
              await backup(passphrase);
            }),
        onSuccess: () {});
  }

  Future<void> generate() async {
    state.keys = await _keysService.generate();
    notifyListeners();
  }

  void _handleError(error, Function() authCallback) async {
    if (error is TikiBkupErrorHttp &&
        error.rsp.code == 401 &&
        onUnauthorized != null) {
      state.accessToken = await onUnauthorized!();
      authCallback();
      notifyListeners();
    } else if (error is TikiBkupErrorLock)
      throw error;
    else if (error is SocketException)
      throw StateError('No internet. Try again');
    else
      throw StateError('Weird error. Try again');
  }
}
