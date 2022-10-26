import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_projek/app/constants/color.dart';

import '../../../data/models/surah.dart';
import '../../../data/models/juz.dart' as juz;

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al Quran'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: const Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Assalamualaikum,",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      appLightBlue,
                      appDarkBlue,
                    ])),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: const Color(0xB5FF1D99),
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      // height: 150,
                      // width: Get.width,

                      child: Stack(
                        children: [
                          Positioned(
                              bottom: -50,
                              right: -20,
                              child: Opacity(
                                opacity: 0.6,
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset(
                                      "assets/images/qurran.png",
                                      fit: BoxFit.contain,
                                    )),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Terakhir Dibaca",
                                      style: TextStyle(
                                        color: appWhite,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Surah",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 25,
                                  ),
                                ),
                                const Text(
                                  "Ayat",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const TabBar(
                  indicatorColor: appDarkBlue,
                  labelColor: appDarkBlue,
                  unselectedLabelColor: appLightBlue,
                  tabs: [
                    Tab(
                      text: "Surah",
                    ),
                    Tab(
                      text: "Juz",
                    ),
                    Tab(
                      text: "Bookmark",
                    )
                  ]),
              Expanded(
                child: TabBarView(
                  children: [
/////////////////////////////////////////////////////////

                    FutureBuilder<List<Surah>>( 
                        future: controller.getAllSurah(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                Surah surah = snapshot.data![index];
                                return ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/batas.png"),
                                    )),
                                    child:
                                        Center(child: Text("${surah.number}")),
                                  ),

                                  // CircleAvatar(
                                  //   child: Text("${surah.number}"),
                                  // ),
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_SURAH,
                                        arguments: surah);
                                  },
                                  title: Text(
                                    "${surah.name?.transliteration?.id}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: appDarkBlue),
                                  ),
                                  subtitle: Text(
                                    "${surah.numberOfVerses} Ayat | ${surah.revelation?.id}",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  trailing: Text("${surah.name?.short}"),
                                );
                              });
                        }),

/////////////////////////////////////////////////////////

                    FutureBuilder<List<juz.Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                juz.Juz detailJuz = snapshot.data![index];
                                
                                
                                String nameStart = detailJuz.juzStartInfo?.split(" - ").first ?? "";
                                String nameEnd = detailJuz.juzEndInfo?.split(" - ").first ?? "";
                                
                                List<Surah> allSurahinJuz = [];
                                List<Surah> rawAllSurahinJuz = [];
                                
                                
                                for (Surah item  in controller.allSurah) {
                                  rawAllSurahinJuz.add(item);
                                  if(item.name!.transliteration!.id == nameEnd){
                                    break;
                                  }
                                }

                                for (Surah item  in rawAllSurahinJuz.reversed.toList()) {
                                  allSurahinJuz.add(item);
                                  if(item.name!.transliteration!.id == nameStart){
                                    break;
                                  }
                                }

                                return ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/batas.png"),
                                    )
                                    ),
                                    child:
                                        Center(child: Text("${index+1}")),
                                  ),
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_JUZ,
                                        arguments: {
                                          "juz": detailJuz,
                                          "surah": allSurahinJuz.reversed.toList(),
                                  }
                                  );
                                  },
                                  title: Text(
                                    "Juz ${index+1}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: appDarkBlue),
                                  ),
                                  isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mulai Dari${detailJuz.juzStartInfo}",
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "Sampai ${detailJuz.juzEndInfo}",
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  trailing: Text("${detailJuz.totalVerses} Ayat"),
                                );
                              }
                              );
                  
                  }            
              ),

////////////////////////////////////////////////////////////

                    const Center(child: Text("Page 1")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
