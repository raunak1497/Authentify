import 'package:authetify/pages/splash_screen.dart';
import 'package:authetify/pages/generate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

void main() async {
  //widgetApp //MaterialApp //CupertinoApp
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Client httpClient;
  Web3Client ethClient;

  final myAddress = "0xe42CB51C701a8f2B8e0798Fa70e0B13f775DD7f3";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ScannerPage(),

      routes: {
        GeneratorPage.routeName: (context) => GeneratorPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: SplashScreen(),
    );
  }
}
