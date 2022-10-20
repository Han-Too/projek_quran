import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_projek/app/constants/color.dart';

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
              ),
            ),
            const Text(
              "Jangan Lupa Dunia Lainnya Bro",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Lottie.asset("assets/lotties/splashart.json")),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
                  // backgroundColor: Get.isDarkMode ?  appDarkBlue : appWhite,
                  backgroundColor: Get.isDarkMode ?  appWhite : appBlue1 ,
                  padding: const EdgeInsets.all(20),
              ),
              child:  Text("Mulai Mengaji",
              style: TextStyle(
                // color: Get.isDarkMode ? appWhite : appDarkBlue ,
                color: Get.isDarkMode ? appBlue1 : appWhite ,
                fontSize: 20,
                fontWeight: FontWeight.bold,),),
            ),
          ],
        ),
      ),
    );
  }
}
