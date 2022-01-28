/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:httpp/httpp.dart';
import 'package:recover/src/model/recover_model_state.dart';

import 'src/recover_service.dart';
import 'src/recover_style.dart';

export 'src/recover_style.dart';

class Recover {
  final RecoverService _service;

  Recover(
      {required String email,
      required String accessToken,
      RecoverStyle? style,
      FlutterSecureStorage? secureStorage,
      Httpp? httpp})
      : _service = RecoverService(
            RecoverModelState(email: email, accessToken: accessToken),
            style ?? RecoverStyle(),
            secureStorage: secureStorage,
            httpp: httpp);

  Future<void> show(BuildContext context) => _service.presenter.render(context);
}
