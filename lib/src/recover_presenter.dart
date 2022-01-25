/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/recover_model_config.dart';
import 'recover_service.dart';
import 'ui/recover_ui_layout.dart';

class RecoverPresenter {
  final RecoverService service;
  final RecoverModelConfig config;

  RecoverPresenter(this.service, this.config);

  Future<void> render(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: config.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(size.width * 0.06))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service, child: RecoverUiLayout()));
  }
}
