import 'package:authetify/pages/scanner.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scanner/';

void main() {
  //widgetApp //MaterialApp //CupertinoApp
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScannerPage(),
      routes: {
        ScannerPage.routeName: (context) => ScannerPage(),
      },
    );
  }
}
