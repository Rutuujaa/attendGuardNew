import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/scan_qr_code_controller.dart';
import 'package:example_getx/app/modules/scan_qr_code/qrcode_scanner_screen.dart';

class ScanQrCodeView extends GetView<ScanQrCodeController> {
  ScanQrCodeView({Key? key, String modifiedResult = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 110, 34),
        title: const Center(
          child: Text("QR code Page"),
        ),
        centerTitle: true,
        leading: Image.asset(
          "images/qrcodeicon.jpg",
          width: 40.0,
          height: 40.0,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "images/qrcode_image.png",
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 249, 248, 248).withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrCodeScannerScreen(
                              modifiedResult: 'result1',
                              onVerifyPressed: (String code) {},
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 240, 110, 34),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        shadowColor: Color.fromARGB(255, 10, 10, 10),
                      ),
                      child: const Text(
                        "Scan QR Code",
                        style: TextStyle(
                          color: Color.fromARGB(255, 239, 235, 235),
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
