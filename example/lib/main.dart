import 'package:flutter/material.dart';
import 'package:recover/recover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(child: openModal()),
      ),
    );
  }
}

class openModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Recover(
                email: 'tiki@mytiki.com',
                accessToken: '',
                style: RecoverStyle(
                    mediaQueryData: MediaQuery.of(context),
                    fontFamily: 'NunitoSans',
                    textColor: Color(0xFF00133F),
                    buttonColor: Color(0xFFFF521C)))
            .show(context),
        child: Text('Open Modal'));
  }
}
