import 'BookChapterModel.dart';

class BookModel {

  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  final String authors;
  final String publisher;
  final String language;
  final String isbn10;
  final String pages;
  final String year;
  final String rating;
  final String desc;
  final List<BookChapterModel> pdf;

  BookModel({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,

    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.pdf,
  });

  factory BookModel.fromJson(json) {
    return BookModel(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }

}