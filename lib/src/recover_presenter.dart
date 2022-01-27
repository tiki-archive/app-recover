/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'recover_service.dart';
import 'recover_style.dart';
import 'ui/recover_ui_layout.dart';

class RecoverPresenter {
  final RecoverService _service;
  final RecoverStyle _style;

  RecoverPresenter(this._service, this._style);

  Future<void> render(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: _style.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(_style.modalRadius))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: _service, child: RecoverUiLayout(_style)));
  }
}
