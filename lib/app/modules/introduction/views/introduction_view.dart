import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Al-Quran Indonesia",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 64, 221),
              ),
            ),
            const Text(
              "Jangan Lupa Dunia Lainnya Bro",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 1, 34, 116),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Lottie.asset("assets/lotties/splashart.json")),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              minWidth: 200,
              color: const Color.fromARGB(255, 0, 64, 221),
              textColor: Colors.white,
              splashColor: const Color.fromARGB(255, 100, 160, 250),
              child: const Text("Mulai Mengaji"),
            ),
          ],
        ),
      ),
    );
  }
}
