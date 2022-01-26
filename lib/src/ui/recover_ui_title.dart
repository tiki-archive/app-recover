import 'package:flutter/material.dart';
import '../config/config_color.dart';
import '../config/config_font.dart';

class RecoverUiTitle extends StatelessWidget{

  final String _text;

  const RecoverUiTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text, style:TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      fontFamily: ConfigFont.familyNunitoSans,
      color: ConfigColor.tikiBlue,
    ));
  }

}