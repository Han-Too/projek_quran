import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/juz.dart';
import '../../../data/models/surah.dart';
import '../../../data/models/quote.dart';

class HomeController extends GetxController {

  List<Surah> allSurah = [];
  List<Quote> allQuote = [];

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }

  Future<List<Juz>> getAllJuz() async {
    
    List<Juz> allJuz = [];

    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.quran.gading.dev/juz/$i");
      var res = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];

      Juz juz = Juz.fromJson(data);
      allJuz.add(juz);
    }
    return allJuz;
  }

Future<List<Quote>> getAllQuote() async {
    Uri url = Uri.parse("https://zenquotes.io/api/random");
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)[""];

    if (data.isEmpty) {
      return [];
    } else {
      allQuote = data.map((e) => Quote.fromJson(e)).toList();
      return allQuote;
    }
  }

  
}
