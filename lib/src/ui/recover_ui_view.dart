/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../recover.dart';
import '../recover_controller.dart';
import '../recover_service.dart';
import '../widget/recover_widget_icons.dart';

abstract class RecoverUiView extends StatelessWidget {
  late final RecoverStyle style;
  late final RecoverController controller;

  @override
  Widget build(BuildContext context) {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    style = service.style;
    controller = service.controller;
    return Container(
        padding: EdgeInsets.only(top: style.size(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => back(context),
                    child: Icon(RecoverWidgetIcons.arrow,
                        size: style.modalNavIconSize,
                        color: style.modalNavColor)),
                TextButton(
                    onPressed: () => controller.close(context),
                    child: Icon(RecoverWidgetIcons.x,
                        size: style.modalNavIconSize,
                        color: style.modalNavColor))
              ],
            ),
            page(context)
          ],
        ));
  }

  Widget page(BuildContext context);

  void back(BuildContext context);
}
