import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/scan_qr_code_controller.dart';

class PersonInfoScreen extends GetView<ScanQrCodeController> {
  final String photoUrl;
  final String rollNo;
  final String signatureUrl;

  PersonInfoScreen(
      {required this.photoUrl,
      required this.rollNo,
      required this.signatureUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(photoUrl),
            SizedBox(height: 20),
            Text('Roll No: $rollNo'),
            SizedBox(height: 20),
            Image.network(signatureUrl),
          ],
        ),
      ),
    );
  }
}
