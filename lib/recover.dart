/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'src/recover_service.dart';
import 'src/recover_style.dart';

export 'src/recover_style.dart';

class Recover {
  final RecoverService _service;

  Recover({RecoverStyle? style})
      : _service = RecoverService(style ?? RecoverStyle());

  Future<void> show(BuildContext context) => _service.presenter.render(context);
}
