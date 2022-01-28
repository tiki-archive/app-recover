/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';

import 'model/recover_model.dart';
import 'model/recover_model_state.dart';
import 'recover_controller.dart';
import 'recover_presenter.dart';
import 'recover_style.dart';

class RecoverService extends ChangeNotifier {
  final RecoverModelState state = RecoverModelState();
  late final RecoverPresenter presenter;
  late final RecoverController controller;
  late final RecoverModel model;

  RecoverService({
    required String email,
    required String token,
    required RecoverStyle style
  }) {
    presenter = RecoverPresenter(this);
    controller = RecoverController(this);
    model = RecoverModel();
    model.email = email;
    model.token = token;
    model.style = style;
  }

  void notify() {
    notifyListeners();
  }

  Future<void> createKeys() async{
    await Future.delayed(Duration(seconds:5));
  }

  Future<void> backupKeys() async{
    await Future.delayed(Duration(seconds:3));
  }
}
