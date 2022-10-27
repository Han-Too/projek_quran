class Hadist {
  List<AllChapters>? allChapters;

  Hadist({this.allChapters});

  Hadist.fromJson(Map<String, dynamic> json) {
    if (json['AllChapters'] != null) {
      allChapters = <AllChapters>[];
      json['AllChapters'].forEach((v) {
        allChapters!.add(AllChapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allChapters != null) {
      data['AllChapters'] = allChapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllChapters {
  int? bookID;
  int? chapterID;
  int? hadithID;
  String? enText;
  String? enSanad;

  AllChapters(
      {this.bookID, this.chapterID, this.hadithID, this.enText, this.enSanad});

  AllChapters.fromJson(Map<String, dynamic>? json) {
    bookID = json?['Book_ID'];
    chapterID = json?['Chapter_ID'];
    hadithID = json?['Hadith_ID'];
    enText = json?['En_Text'];
    enSanad = json?['En_Sanad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Book_ID'] = bookID;
    data['Chapter_ID'] = chapterID;
    data['Hadith_ID'] = hadithID;
    data['En_Text'] = enText;
    data['En_Sanad'] = enSanad;
    return data;
  }
}
