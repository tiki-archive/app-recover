/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'model/recover_model_state.dart';
import 'recover_controller.dart';
import 'recover_presenter.dart';
import 'recover_style.dart';

class RecoverService extends ChangeNotifier {
  final RecoverModelState state = RecoverModelState();
  late final RecoverPresenter presenter;
  late final RecoverController controller;

  RecoverService(RecoverStyle style) {
    presenter = RecoverPresenter(this, style);
    controller = RecoverController(this);
  }
}
