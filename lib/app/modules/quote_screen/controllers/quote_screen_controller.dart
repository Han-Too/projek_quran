import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/models/quotes.dart';
import 'package:http/http.dart' as http;

class QuoteScreenController extends GetxController {
  static Future<Quotes?> getQuotes() async {
    Uri url = Uri.parse('http://api.quotable.io/random');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print("success");
      return Quotes.fromJson(jsonDecode(response.body));
    } else {
      print("error in getting data");
    }
    return null;
  }
}
