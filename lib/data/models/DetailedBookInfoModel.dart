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

  factory DetailedBookInfoModel.fromJson(json) {
    return DetailedBookInfoModel(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
 
      authors: json['authors'],
      publisher: json['publisher'],
      language: json['language'],
      isbn10: json['isbn10'],
      pages: json['pages'],
      year: json['year'],
      rating: json['rating'],
      desc: json['desc'],
      pdf: BookChapterModel.fromJsonList(json['pdf']),
    );
  }

}