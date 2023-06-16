import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//import '../controllers/input_roll_no_controller.dart';
import '../input_roll_no/views/input_roll_no_view.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen(
      {Key? key,
      required String modifiedResult,
      required Null Function(String code) onVerifyPressed})
      : super(key: key);

  @override
  _QrCodeScannerScreenState createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {
  late Size size;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  Barcode? result;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
        title: Row(
          children: [
            Image.asset(
              'images/qrcodeicon.jpg',
              width: 30.0,
              height: 30.0,
            ),
            const Text('QR Code Scanner'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color.fromARGB(255, 247, 239, 239),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 9, child: _buildQrView(context)),
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromARGB(255, 17, 14, 14),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await controller.toggleFlash();
                      },
                      child: const Icon(
                        Icons.flash_on,
                        size: 24,
                        color: Color.fromARGB(249, 243, 240, 240),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.flipCamera();
                      },
                      child: const Icon(
                        Icons.flip_camera_ios,
                        size: 24,
                        color: Color.fromARGB(248, 240, 239, 239),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    const double scanArea = 250.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: scanArea,
        borderWidth: 10,
        borderLength: 40,
        borderRadius: 5.0,
        borderColor: const Color(0xffF7524F),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        controller.pauseCamera();
      });
      if (result != null && result!.code!.isNotEmpty) {
        print('QR code scanned: ${result!.code}');
        _showResult();
      }
    });
  }

  void _showResult() {
    bool isURL = Uri.tryParse(result!.code!) != null;

    Get.off(() => InputRollNoView(rollNo: result!.code!));

    if (isURL) {
      _launchURL(result!.code);
    }
  }

  void _launchURL(String? code) {
    // Implement the logic to launch the URL here
  }
}
