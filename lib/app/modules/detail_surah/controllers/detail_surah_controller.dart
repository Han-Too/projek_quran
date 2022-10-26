import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:quran_projek/app/data/db/bookmark.dart';
import 'package:sqflite/sqflite.dart';

import '../../../data/models/detail_surah.dart';

class DetailSurahController extends GetxController {

  // RxString kondisiAudio = "stop".obs;
  final player = AudioPlayer();
  Verse? lastVerse;

  DatabaseManager database = DatabaseManager.instance;

  void addBookmark(bool lastRead, DetailSurah surah,Verse ayat, int indexAyat) async {
    Database db = await database.db;

    await db.insert(
      "bookmark",
      {
        // ignore: unnecessary_string_interpolations
        "surah" : "${surah.name!.transliteration!.id!}",
        "ayat" : ayat.number!.inSurah!,
        "juz" : ayat.meta!.juz!,
        "via" : "surah",
        "index_ayat" : indexAyat,
        "last_read" : lastRead == true ? 1 : 0,
      },
    );
  
  Get.back();
  Get.snackbar("Berhasil", "Berhasil Menambahkan Bookmark");

  var data = await db.query("bookmark");
  print(data);
  }


  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    // DetailSurah tes =  DetailSurah.fromJson(data);
    // print(tes);

    return DetailSurah.fromJson(data);
  }

  void stopAudio(Verse ayat) async {
    try {
        
        await player.stop();
        ayat.kondisiAudio = "stop";
        update();



      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Dapat Pause Audio",
      );
      }
  }

void resumeAudio(Verse ayat) async {
    try {
        
        ayat.kondisiAudio = "playing";
        update();
        await player.play();
        ayat.kondisiAudio = "stop";
        update();



      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Dapat Pause Audio",
      );
      }
  }

  void pauseAudio(Verse ayat) async {
    try {
        
        await player.pause();
        ayat.kondisiAudio = "pause";
        update();



      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Dapat Pause Audio",
      );
      }
  }

  void playAudio(Verse ayat) async {
    if (ayat.audio!.primary != null) {
      // Catching errors at load time
      try {
        // ignore: prefer_conditional_assignment
        if(lastVerse == null){
          lastVerse = ayat;
        }
        lastVerse!.kondisiAudio = "stop";
        lastVerse = ayat;
        lastVerse!.kondisiAudio = "stop";
        update();
        await player.stop();
        await player.setUrl(ayat.audio!.primary!);
        ayat.kondisiAudio = "playing";
        update();
        await player.play();
        ayat.kondisiAudio = "stop";
        update();
        await player.stop();



      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Connection aborted: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak Dapat Memutar Audio",
      );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "URL Audio Tidak Ada",
      );
    }

  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
