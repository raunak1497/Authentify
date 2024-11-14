// import 'dart:html';

import 'package:flutter/material.dart';
import 'scanQR.dart';

// import 'package:barcode_scan/barcode_scan.dart';

class ScannerPage extends StatelessWidget {
  static const String routeName = "/scanner";
  const ScannerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height) -
                    AppBar().preferredSize.height -
                    kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("QR.png"),
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  radius: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                        tag: "Scan QR",
                        child: Container(
                          width: ((MediaQuery.of(context).size.width) / 2) - 45,
                          height: 50,
                          child: OutlineButton(
                            focusColor: Colors.red,
                            highlightColor: Colors.blue,
                            hoverColor: Colors.lightBlue[100],
                            borderSide:
                                BorderSide(width: 3, color: Colors.blue),
                            shape: StadiumBorder(),
                            child: Text(
                              "Scan QR",
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScanQR()));
                            },
                          ),
                        )),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
