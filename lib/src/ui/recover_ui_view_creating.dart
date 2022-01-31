/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../widget/recover_widget_icons.dart';

import '../recover_service.dart';
import '../widget/recover_widget_text.dart';

class RecoverUiViewCreating extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecoverUiViewCreating();
}

class _RecoverUiViewCreating extends State<RecoverUiViewCreating> {
  static const String _title = 'Creating your account...';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      RecoverService service =
          Provider.of<RecoverService>(context, listen: false);
      await Future.wait(
          [service.generate(), Future.delayed(Duration(seconds: 2))]);
      service.controller.showBackup();
    });
  }

  @override
  Widget build(BuildContext context) {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    return Container(
        padding: EdgeInsets.only(top: service.style.size(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: service.controller.showAccount,
                    child: Icon(RecoverWidgetIcons.arrow,
                        size: service.style.modalNavIconSize,
                        color: service.style.modalNavColor)),
                TextButton(
                    onPressed: () => service.controller.close(context),
                    child: Icon(RecoverWidgetIcons.x,
                        size: service.style.modalNavIconSize,
                        color: service.style.modalNavColor))
              ],
            ),
            Container(
                height: service.style.modalContainerHeight,
                padding: EdgeInsets.all(service.style.modalContentPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.only(bottom: service.style.size(10)),
                        child: RecoverWidgetText(_title)),
                    Expanded(
                        child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: ClipRect(
                        child: Align(
                            alignment: Alignment.center,
                            heightFactor: 0.66,
                            widthFactor: 1,
                            child: ConstrainedBox(
                                constraints:
                                    BoxConstraints(minWidth: 1, minHeight: 1),
                                child: Lottie.asset(
                                    "res/animation/creating.json",
                                    package: 'recover'))),
                      ),
                    )),
                  ],
                ))
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
