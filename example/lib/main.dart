import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
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
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) => print(
        '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
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
