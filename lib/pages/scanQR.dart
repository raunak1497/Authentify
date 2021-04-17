import 'package:authetify/pages/scanner.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanQR extends StatefulWidget {
  ScanQR({Key key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

String qrData = "No Data Found";
var data;
bool hasData = false;

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Scan QR",
      child: Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Raw Data : ${(qrData)}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.launch_outlined),
                    onPressed: hasData
                        ? () async {
                            if (await canLaunch(qrData)) {
                              await launch(qrData);
                            } else {
                              throw "Could not Launch";
                            }
                          }
                        : null,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: ((MediaQuery.of(context).size.width) / 2) - 45,
                height: 50,
                child: OutlineButton(
                  focusColor: Colors.red,
                  highlightColor: Colors.blue,
                  hoverColor: Colors.lightBlue[100],
                  borderSide: BorderSide(width: 3, color: Colors.blue),
                  shape: StadiumBorder(),
                  child: Text(
                    "Scan QR",
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () async {
                    var option = ScanOptions(autoEnableFlash: true);
                    data = await BarcodeScanner.scan(options: option);
                    setState(() {
                      qrData = data.rawContent.toString();
                      hasData = true;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
