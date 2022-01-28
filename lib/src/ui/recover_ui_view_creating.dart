/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../widget/recover_widget_text.dart';

import '../recover_service.dart';

class RecoverUiViewCreating extends StatelessWidget {
  static const String _title = 'Creating your account...';

  @override
  Widget build(BuildContext context) {
    RecoverService service =
        Provider.of<RecoverService>(context, listen: false);
    _awaitKeysCreation(context, service);
    return Container(
        height: service.style.modalContainerHeight,
        padding: EdgeInsets.all(service.style.modalContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: service.style.size(10)),
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
                        constraints: BoxConstraints(minWidth: 1, minHeight: 1),
                        child: Lottie.asset("res/animation/creating.json",
                            package: 'recover'))),
              ),
            )),
          ],
        ));
  }

  void _awaitKeysCreation(BuildContext context, RecoverService service) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.wait(
          [service.generate(), Future.delayed(Duration(seconds: 2))]);
      //service.controller.goToBackupYourAccount();
    });
  }
}
