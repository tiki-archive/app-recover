import 'package:flutter/material.dart';
import '../config/config_color.dart';
import '../config/config_font.dart';

class RecoverUiTitle extends StatelessWidget{

  final String _text;

  const RecoverUiTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text, textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.2,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          fontFamily: ConfigFont.familyNunitoSans,
          color: ConfigColor.tikiBlue,
        )
    );
  }

}