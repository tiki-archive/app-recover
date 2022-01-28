/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:typed_data';

import 'package:wallet/wallet.dart';

import 'recover_model_page.dart';

class RecoverModelState {
  RecoverModelPage page = RecoverModelPage.account;

  String? email;
  String? accessToken;

  String? pin;
  String? passphrase;
  String? newPin;
  String? newPassphrase;

  Uint8List? ciphertext;
  TikiKeysModel? keys;
}
