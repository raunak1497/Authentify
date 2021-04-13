import 'dart:html';

import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  static const String routeName = "/scanner";
  const ScannerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authetify"),
      ),
      body: Center(
        child: Text(
          "Scan the QR code",
          style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
