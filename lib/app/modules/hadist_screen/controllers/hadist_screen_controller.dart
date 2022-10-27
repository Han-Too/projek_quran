import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/models/hadist.dart';
import 'package:http/http.dart' as http;

class HadistScreenController extends GetxController {

  List<Hadist> allHadist = [];
  List<Hadist> allHadis = [];

  Future<List<Hadist>> getAllHadist() async {
    Uri url = Uri.parse("https://ahadith-api.herokuapp.com/api/ahadith/all/en");
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)["AllChapters"];

    allHadist= data.map((e) => Hadist.fromJson(e)).toList();

    return allHadist;
  }

Future<List<Hadist>> getAllHadis() async {
    Uri url = Uri.parse("https://ahadith-api.herokuapp.com/api/ahadith/all/en");
    var res = await http.get(url);
    List data2 = (json.decode(res.body) as Map<String, dynamic>)["AllChapters"];

    if (data2.isEmpty) {
      return [];
    } else {
      allHadis = data2.map((e) => Hadist.fromJson(e)).toList();
      return allHadis;
    }
  }

}
