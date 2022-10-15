import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_projek/app/data/models/detail_surah.dart';
import 'package:quran_projek/app/data/models/surah.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");

  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  // print(data[113]) ;

  // data api ke model

  Surah surahAnnas = Surah.fromJson(data[113]);
  
  // print(surahAnnas.name) ;
  // print("==============");
  // print(surahAnnas.number);
  // print("==============");
  // print(surahAnnas.numberOfVerses) ;
  // print("==============");
  // print(surahAnnas.sequence) ;
  // print("==============");
  // print(surahAnnas.tafsir) ;


  // COBA MASUK NESTED MODEL
  // print(surahAnnas.name?.transliteration?.id) ;
  
  Uri urlannas = Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  var resannas = await http.get(urlannas);

  Map<String,dynamic> dataannas = (json.decode(resannas.body) as Map<String,dynamic>)["data"];
//DATA annas dari api

  DetailSurah annas = DetailSurah.fromJson(dataannas);

  print(annas.verses![1].text!.arab);



}