import 'dart:developer';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:scanner/result/result.dart';

class HomeController extends GetxController {
  Barcode? result;
  late BuildContext context;
  QRViewController? QRcontroller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void dispose() {
    QRcontroller?.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    QRcontroller = controller;
    update();
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      update();
      Get.back();
      show(context, result!.code);
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
