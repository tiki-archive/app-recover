/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:wallet/wallet.dart';

import 'model/recover_model_page.dart';
import 'model/recover_model_state.dart';
import 'recover_controller.dart';
import 'recover_presenter.dart';
import 'recover_style.dart';

class RecoverService extends ChangeNotifier {
  final RecoverModelState state = RecoverModelState();
  final TikiKeysService _keysService;
  final TikiBkupService _bkupService;
  late final RecoverPresenter presenter;
  late final RecoverController controller;

  RecoverService(RecoverStyle style,
      {FlutterSecureStorage? secureStorage, Httpp? httpp})
      : _keysService = TikiKeysService(secureStorage: secureStorage),
        _bkupService = TikiBkupService(httpp: httpp) {
    presenter = RecoverPresenter(this, style);
    controller = RecoverController(this);
  }

  void showPage(RecoverModelPage page) {
    state.page = page;
    notifyListeners();
  }

  Future<void> decode(String address, String data, String sign) async {
    try {
      state.keys = TikiKeysModel.decode(address, sign, data);
      return _keysService.provide(state.keys!);
    } catch (error) {
      // problem with qr code
    }
  }

  Future<void> decrypt(String passphrase) async {
    state.keys = await _keysService.decrypt(passphrase, state.ciphertext!);
    if (state.keys == null) {
      // invalid passphrase
    }
    return _keysService.provide(state.keys!);
  }

  Future<void> lookup(String pin) => _bkupService.recover(
      email: state.email!,
      accessToken: state.accessToken!,
      pin: pin,
      onError: (error) {
        //misc error
      },
      onSuccess: (ciphertext) {
        if (ciphertext == null) {
          //pin failed
        }
        state.ciphertext = ciphertext;
      });

  Future<void> cycle(String passphrase) async {
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

  Future<void> backup(String passphrase) async {
    Uint8List ciphertext = await _keysService.encrypt(passphrase, state.keys!);
    return _bkupService.backup(
        email: state.email!,
        accessToken: state.accessToken!,
        pin: state.pin!,
        ciphertext: ciphertext,
        onError: (error) {
          //misc error
        },
        onSuccess: () {
          //backup worked
        });
  }
}
