import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            Card(
              color: Colors.lightBlue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      surah.name?.transliteration?.id?.toUpperCase() ?? 'error',
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
            ),//card
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<detail.DetailSurah>( 
                future: controller.getDetailSurah(surah.number.toString()),
                builder: (context,snapshot){
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
                    if(snapshot.data?.verses == null || snapshot.data?.verses?.length == 0){
                      return const SizedBox();
                    }

                    detail.Verse? ayat = snapshot.data?.verses?[index] ;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    child: Text("${index + 1}"),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.bookmark_add_outlined)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.play_arrow)),
                                    ],
                                  ), //ROW ICON
                                ] //CHILDREN ROW AWAL
                                ), //ROW AWAL
                          ), //ROW DALEM CARD DALEM BUILDER
                        ), //CARD ATAS YANG BERBUTTON
                        const SizedBox(height: 20,),
                        Text("${ayat!.text?.arab}",
                        textAlign: TextAlign.end, 
                        style:  const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 5,),
                        Text("${ayat.text?.transliteration?.en}",
                        textAlign: TextAlign.left, 
                        style:  const TextStyle(fontSize: 15,fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 25,),
                        Text("${ayat.translation?.id}",
                        textAlign: TextAlign.justify, 
                        style:  const TextStyle(fontSize:20),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ], //CHILDREN COLUMN TAMPILAN
                    ); //CARD LISTVIEWBUILDER
                  }), //ITEMBUILDER LISTVIEW KE2
                );
              }), //FUTUREBUILDING COKK
            )
          ], //children listview awal
        ));
  } //build
}//class