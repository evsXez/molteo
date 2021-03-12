class BookChapterModel {

  final String chapter;
  final String url;

  BookChapterModel(this.chapter, this.url);

  static List<BookChapterModel> fromJsonList(json) {
    if (json is Map<dynamic,dynamic>) {
      return json.keys.map((key) => BookChapterModel(key, json[key])).toList();
    }
    return [];
  }

}