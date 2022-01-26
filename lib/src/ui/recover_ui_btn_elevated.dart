import 'package:flutter/material.dart';
import '../config/config_color.dart';

class RecoverUiBtnElevated extends StatelessWidget{

  late final String _text;
  late final Function _callback;

  RecoverUiBtnElevated({required text, required callback}) :
        _text = text,
        _callback = callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _callback,
        child: Text(_text, style:TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.white,
        )),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, double.infinity),
        primary: ConfigColor.orange,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}