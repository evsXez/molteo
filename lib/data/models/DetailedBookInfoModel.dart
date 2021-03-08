import 'dart:convert';

import 'package:molteo/data/models/BookInfoModel.dart';

import 'BookChapterModel.dart';

class DetailedBookInfoModel extends BookInfoModel {

  final String authors;
  final String publisher;
  final String language;
  final String isbn10;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final List<BookChapterModel> pdf;

  DetailedBookInfoModel({
    String title,
    String subtitle,
    String isbn13,
    String price,
    String image,
    String url,

    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.pdf,
  }) : super(
    title: title,
    subtitle: subtitle,
    isbn13: isbn13,
    price: price,
    image: image,
    url: url,
  );

  factory DetailedBookInfoModel.fromJson(String source) {
    final obj = json.decode(source);
    return DetailedBookInfoModel(
      title: obj['title'],
      subtitle: obj['subtitle'],
      isbn13: obj['isbn13'],
      price: obj['price'],
      image: obj['image'],
      url: obj['url'],
 
      authors: obj['authors'],
      publisher: obj['publisher'],
      language: obj['language'],
      isbn10: obj['isbn10'],
      pages: obj['pages'],
      year: obj['year'],
      rating: obj['rating'],
      desc: obj['desc'],
      pdf: BookChapterModel.fromJsonList(obj['pdf']),
    );
  }

}