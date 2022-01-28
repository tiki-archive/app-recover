import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../recover.dart';
import '../recover_service.dart';

class RecoverWidgetTitle extends StatelessWidget{

  final String _text;

  const RecoverWidgetTitle(this._text);

  @override
  Widget build(BuildContext context) {
    RecoverService service = Provider.of<RecoverService>(context);
    RecoverStyle style = service.model.style;
    return Text(_text, textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.2,
          fontWeight: FontWeight.w400,
          fontSize: style.titleSize,
          fontFamily: style.fontFamily,
          color: style.titleColor,
        )
    );
  }

}