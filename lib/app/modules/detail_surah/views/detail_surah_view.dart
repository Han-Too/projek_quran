import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/surah.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);
  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "SURAH ${surah.name?.transliteration?.id?.toUpperCase() ?? 'error'}",
            style: const TextStyle(fontSize: 15),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            GestureDetector(
              onTap: () => Get.defaultDialog(
                titlePadding: const EdgeInsets.only(top: 30),
                title: ("Tafsir Surah ${surah.name?.transliteration?.id}")
                    .toUpperCase(),
                titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: appBlue),
                // ignore: avoid_unnecessary_containers
                contentPadding: const EdgeInsets.all(20),
                content: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    // ignore: unnecessary_string_interpolations
                    "${surah.tafsir?.id ?? 'Tidak ada Tafsir Surah'}",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          appBatas,
                          appBlue,
                        ])),
                // color: appBlue,
                // shape: const RoundedRectangleBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(30),
                //   ),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        surah.name?.transliteration?.id?.toUpperCase() ??
                            'error',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), //TEKS JUDUL
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        " ( ${surah.name?.translation?.id?.toUpperCase() ?? 'error'} ) ",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ), //TEKS ARTI
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${surah.numberOfVerses ?? 'error'} Ayat | ${surah.revelation?.id}",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), //TEKS AYAT
                    ],
                  ),
                ), //column
              ),
            ), //card
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<detail.DetailSurah>(
                future: controller.getDetailSurah(surah.number.toString()),
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
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.verses?.length ?? 0,
                    itemBuilder: ((context, index) {
                      // ignore: prefer_is_empty
                      if (snapshot.data?.verses == null ||
                          // ignore: prefer_is_empty
                          snapshot.data?.verses?.length == 0) {
                        return const SizedBox();
                      }

                      detail.Verse? ayat = snapshot.data?.verses?[index];

                      return Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
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
                                          "${index + 1}",
                                          style: const TextStyle(
                                              color: appDarkBlue),
                                        ),
                                      ),
                                    ),
                                    GetBuilder<DetailSurahController>(
                                      builder: (c) => Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.dialog(
                                                  AlertDialog(
                                                    title: Text("Tafsir ${surah.name?.transliteration?.id} Ayat ${index+1}"),
                                                    scrollable: true,
                                                    content: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text("${ayat?.tafsir?.id?.short}",textAlign: TextAlign.justify,),
                                                      ],
                                                    ),
                                                  )
                                                  );

                                                  // title: "Tafsir Ayat",
                                                  // middleText: "${ayat?.tafsir?.id?.short}",
                                                  // actions: [

                                                  // ]
                                                

                                                // showDialog(
                                                //   context: context,
                                                //   builder: (_) => AlertDialog(
                                                //     title: const Text("Tafsir Ayat"),
                                                //     scrollable : true,
                                                //     shape:
                                                //         const RoundedRectangleBorder(
                                                //       borderRadius:
                                                //           BorderRadius.all(
                                                //         Radius.circular(12.0),
                                                //       ),
                                                //     ),
                                                //     content: Builder(
                                                //       builder: (context) {
                                                //         var height =
                                                //             MediaQuery.of(
                                                //                     context)
                                                //                 .size
                                                //                 .height;
                                                //         var width =
                                                //             MediaQuery.of(
                                                //                     context)
                                                //                 .size
                                                //                 .width;

                                                //         return SizedBox(
                                                //           height: height -10,
                                                //           width: width -10,
                                                //           child: Center(
                                                //             child: Text(
                                                //                 "${ayat?.tafsir?.id?.short}",textAlign: TextAlign.justify,),
                                                //           ),
                                                //         );
                                                //       },
                                                //     ),
                                                //   ),
                                                // );
                                              },
                                              icon: const Icon(
                                                Icons.info_outline,
                                                color: appDarkBlue,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                    title: "BOOKMARK",
                                                    middleText:
                                                        "Pilih Bookmark",
                                                    actions: [
                                                      
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          c.addBookmark(true,snapshot.data!, ayat!,index);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              appDarkBlue,
                                                          foregroundColor:
                                                              appWhite,
                                                        ),
                                                        child: const Text(
                                                            "LAST READ"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          c.addBookmark(false,snapshot.data!, ayat!,index);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              appDarkBlue,
                                                          foregroundColor:
                                                              appWhite,
                                                        ),
                                                        child: const Text(
                                                            "BOOKMARK"),
                                                      ),
                                                    ]
                                                    );
                                              },
                                              icon: const Icon(
                                                Icons.bookmark_add_outlined,
                                                color: appDarkBlue,
                                              )),
                                          (ayat?.kondisiAudio == "stop")
                                              ? IconButton(
                                                  onPressed: () {
                                                    c.playAudio(ayat!);
                                                  },
                                                  icon: const Icon(
                                                      Icons.play_arrow,
                                                      color: appDarkBlue))
                                              : Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    (ayat?.kondisiAudio ==
                                                            "playing")
                                                        ? IconButton(
                                                            onPressed: () {
                                                              c.pauseAudio(
                                                                  ayat!);
                                                            },
                                                            icon: const Icon(
                                                                Icons.pause,
                                                                color:
                                                                    appDarkBlue))
                                                        : IconButton(
                                                            onPressed: () {
                                                              c.resumeAudio(
                                                                  ayat!);
                                                            },
                                                            icon: const Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                color:
                                                                    appDarkBlue)),
                                                    IconButton(
                                                        onPressed: () {
                                                          c.stopAudio(ayat!);
                                                        },
                                                        icon: const Icon(
                                                            Icons.stop,
                                                            color: appDarkBlue))
                                                  ],
                                                ),
                                        ],
                                      ),
                                    )
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
                              "${ayat!.text?.arab}",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 30, color: appDarkBlue),
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
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ], //CHILDREN COLUMN TAMPILAN
                      ); //CARD LISTVIEWBUILDER
                    }), //ITEMBUILDER LISTVIEW KE2
                  );
                })
          ], //children listview awal
        ));
  } //build
}//class