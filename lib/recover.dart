/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'src/model/recover_model_config.dart';
import 'src/recover_service.dart';

class Recover {
  final RecoverService _service;

  Recover({Color? backgroundColor, double? topRadius})
      : _service = RecoverService(
            RecoverModelConfig(backgroundColor: backgroundColor));

  Future<void> show(BuildContext context) => _service.presenter.render(context);
}
