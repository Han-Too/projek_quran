import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_projek/app/data/models/ayat.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/108/1");
  var resurl = await http.get(url);

  Map<String,dynamic> data = (json.decode(resurl.body) as Map<String,dynamic>)["data"];
  Map<String,dynamic> dataToModel = {
    "number": data["number"],
    "meta": data["meta"],
    "text": data["text"],
    "translation": data["translation"],
    "audio": data["audio"],
    "tafsir": data["tafsir"], 
  };

  //convert to models map

  Ayat ayat = Ayat.fromJson(dataToModel);

  // print(ayat.tafsir?.id?.long);

}