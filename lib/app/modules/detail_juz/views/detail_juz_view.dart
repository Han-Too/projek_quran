import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../data/models/juz.dart' as juz;
import '../../../data/models/surah.dart';
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final juz.Juz detailJuz = Get.arguments["juz"];
  final List<Surah> allSurahinThisJuz = Get.arguments["surah"];

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_function_literals_in_foreach_calls
    allSurahinThisJuz.forEach((element) {
      print(element.name!.transliteration!.id);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Juz ${detailJuz.juz}'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: detailJuz.verses?.length,
          itemBuilder: (context, index) {
            // ignore: prefer_is_empty
            if (detailJuz.verses == null || detailJuz.verses?.length == 0) {
              return const Center(
                child: Text("Tidak Ada Data Bro"),
              );
            }

            juz.Verses ayat = detailJuz.verses![index];

            if (index != 0) {
              if (ayat.number?.inSurah == 1) {
                controller.index++;
                
              }
            }
            
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appBatas,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                
                                Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/batas.png",
                                    ),
                                    fit: BoxFit.contain,
                                  )),
                                  child: Center(
                                    child: Text(
                                      "${ayat.number?.inSurah}",
                                      style: const TextStyle(color: appWhite),
                                    ),
                                  ),
                                ),
                                Text(
                                  allSurahinThisJuz[controller.index]
                                          .name
                                          ?.transliteration
                                          ?.id ??
                                      '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: appWhite,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                              
                                Text(
                                  allSurahinThisJuz[controller.index]
                                          .name
                                          ?.short ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: appWhite,
                                  ),
                                ),
                                const SizedBox(width: 10,)
                              ],
                            ), //ROW ICON
                          ] //CHILDREN ROW AWAL
                          ), //ROW AWAL
                    ), //ROW DALEM CARD DALEM BUILDER
                  ), //CARD ATAS YANG BERBUTTON
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${ayat.text?.arab}",
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 30, color: appDarkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${ayat.text?.transliteration?.en}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: appLightBlue),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "${ayat.translation?.id}",
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ], //CHILDREN COLUMN TAMPILAN
              ),
            );
          },
        ));
  }
}
