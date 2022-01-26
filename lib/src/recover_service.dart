/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'model/recover_model.dart';
import 'model/recover_model_config.dart';
import 'model/recover_model_state.dart';
import 'recover_controller.dart';
import 'recover_presenter.dart';

class RecoverService extends ChangeNotifier {
  final RecoverModelState state = RecoverModelState();
  late final RecoverPresenter presenter;
  late final RecoverController controller;
  late final RecoverModel model;

  RecoverService(String email, RecoverModelConfig config) {
    presenter = RecoverPresenter(this, config);
    controller = RecoverController(this);
    model = RecoverModel();
    model.email = email;
  }
}
