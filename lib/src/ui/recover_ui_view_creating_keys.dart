/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'recover_ui_title.dart';

class RecoverUiViewCreatingKeys extends StatelessWidget {
  final String _title = 'Creating your account...';

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height/2,
        padding: EdgeInsets.only(top: 70, left: 20, right:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(padding: EdgeInsets.symmetric(horizontal:30), child: RecoverUiTitle(_title)),
            Padding(padding: EdgeInsets.only(bottom:10)),
          Expanded(
            child: ClipRect(
              child: Align(
                  alignment: Alignment.center,
                  heightFactor: 2,
                  child: Lottie.asset(
                      "res/animation/Securing_account_with_blob.json",
                      package: 'recover')),
            ),
          ),
        ],
      )
    );
  }
}
