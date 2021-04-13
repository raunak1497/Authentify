import 'package:authetify/pages/splash_screen.dart';
import 'package:authetify/pages/scanner.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //widgetApp //MaterialApp //CupertinoApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ScannerPage(),
      routes: {
        ScannerPage.routeName: (context) => ScannerPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: SplashScreen(),
    );
  }
}
