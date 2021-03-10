class BookInfoModel {

  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  BookInfoModel({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  factory BookInfoModel.fromJson(Map<dynamic, dynamic> json) {
    return BookInfoModel(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn13: json['isbn13'],
      price: json['price'],
      image: json['image'],
      url: json['url'],
    );
  }

}