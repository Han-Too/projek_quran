import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../data/models/hadist.dart';
import '../controllers/hadist_screen_controller.dart';

class HadistScreenView extends GetView<HadistScreenController> {
  const HadistScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Hadist'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Hadist>>(
          future: controller.getAllHadis(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Tidak Ada Data Bro"),
              );
            }
            // print(snapshot.data);

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Hadist hadist2 = snapshot.data![index];
                  return ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/batas.png"),
                      )),
                      child: const Center(child: Text("")),
                    ),
                    onTap: () {
                      // Get.toNamed(Routes.DETAIL_SURAH,
                      //     arguments: surah);
                    },
                    title: const Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: appDarkBlue),
                    ),
                  );
                });
          }),
    );
  }
}
