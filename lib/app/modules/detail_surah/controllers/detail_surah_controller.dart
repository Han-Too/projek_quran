import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

import '../../../data/models/detail_surah.dart';

class DetailSurahController extends GetxController {

  RxString kondisiAudio = "stop".obs;
  final player = AudioPlayer();



  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    // DetailSurah tes =  DetailSurah.fromJson(data);
    // print(tes);

    return DetailSurah.fromJson(data);
  }

  void stopAudio() async {
    try {
        
        kondisiAudio.value = "playing";
        await player.stop();
        kondisiAudio.value = "stop";



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

void resumeAudio() async {
    try {
        
        kondisiAudio.value = "playing";
        await player.play();
        kondisiAudio.value = "stop";



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

  void pauseAudio() async {
    try {
        
        await player.pause();
        kondisiAudio.value = "pause";



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

  void playAudio(String? url) async {
    if (url != null) {
      // Catching errors at load time
      try {
        await player.stop();
        await player.setUrl(url);
        kondisiAudio.value = "playing";
        await player.play();
        kondisiAudio.value = "stop";
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
