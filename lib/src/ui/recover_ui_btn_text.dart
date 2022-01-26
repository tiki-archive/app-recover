import 'package:flutter/material.dart';
import '../config/config_color.dart';

class RecoverUiBtnText extends StatelessWidget{

  late final String _text;
  late final Function _callback;

  RecoverUiBtnText({required text, required callback}) :
      _text = text,
      _callback = callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, double.infinity),
          padding: EdgeInsets.symmetric(vertical: 20),
        ),
        onPressed: () => _callback,
        child: Text(_text, style:TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: ConfigColor.orange,
        ))
    );
  }
}