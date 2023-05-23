import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/home/home.dart';
import 'package:scanner/home/home_controller.dart';

class Result extends GetView<HomeController> {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(body: GetBuilder<HomeController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Get.to(
                    () => const Home(),
                  );
                },
                child: const Text("Scanner "),
              ),
            ),
          ],
        );
      },
    ));
  }
}

void show(context, data) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      message: Text("$data"),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Copy'),
        ),
      ],
    ),
  );
}
