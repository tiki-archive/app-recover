/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recover/src/recover_style.dart';

import 'recover_service.dart';
import 'ui/recover_ui_layout.dart';

class RecoverPresenter {
  final RecoverService _service;
  final RecoverStyle _style;

  RecoverPresenter(this._service, this._style);

  Future<void> render(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: _style.backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(size.width * (_style.modalRadius) / 100))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: _service, child: RecoverUiLayout(_style)));
  }
}
