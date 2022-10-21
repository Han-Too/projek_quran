

void main() async {
  // Uri url = Uri.parse("https://api.quran.gading.dev/surah");

  // var res = await http.get(url);

  // List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  // print(data[113]) ;

  // data api ke model

  // Surah surahAnnas = Surah.fromJson(data[113]);
  
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
  
//   Uri urlannas = Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
//   var resannas = await http.get(urlannas);

//   Map<String,dynamic> dataannas = (json.decode(resannas.body) as Map<String,dynamic>)["data"];
// //DATA annas dari api

//   DetailSurah annas = DetailSurah.fromJson(dataannas);

  // print(annas.verses![1].text!.arab);

  // TES PREBISMILLAH IS NULL
  // Future<DetailSurah> getDetailSurah(String id) async {
  //   Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
  //   var res = await http.get(url);                                           

  // Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>)["data"];  
  
  // DetailSurah tes =  DetailSurah.fromJson(data);
  // // print(tes.preBismillah);

  // return DetailSurah.fromJson(data);
  // }

  // await getDetailSurah(1.toString());

// TES KONEKSI JUZ


// ignore: unused_element
// Future<List<Juz>> getAllJuz() async {
//   List<Juz> allJuz = [];
  
//   for(int i=1; i<=30; i++){
//     Uri url = Uri.parse("https://api.quran.gading.dev/juz/$i");
//     var res = await http.get(url);
//     Map<String,dynamic> data = (json.decode(res.body) as Map<String, dynamic>)["data"];

//     Juz juz = Juz.fromJson(data);
//     allJuz.add(juz);
//     }
  
//   return allJuz[1];
//     }




}

