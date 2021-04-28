// import 'dart:js';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'generatedQR.dart';

class QRGenerator extends StatefulWidget {
  QRGenerator({Key key}) : super(key: key);

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

TextEditingController myController = new TextEditingController();

class _QRGeneratorState extends State<QRGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Product Info"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                    labelText: "Product Id",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    prefix: Icon(Icons.link),
                  ),
                  onEditingComplete: navigate,
                ),
              ),
            ],
          ),
        ));
  }

  void navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GeneratedQR(myController.text)));
  }
}
