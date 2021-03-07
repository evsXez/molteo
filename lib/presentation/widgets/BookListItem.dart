import 'package:flutter/material.dart';
import 'package:molteo/data/models/BookInfoModel.dart';

class BookListItem extends StatelessWidget {

  final BookInfoModel book;
  BookListItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: image,
        title: Text(book.title),
        subtitle: Text(book.subtitle),
        trailing: Text(book.price),
      ),
    );
  }

  // Widget get image => Image.network(book.image, width: 50, height: 80);
  Widget get image => Container(color: Colors.grey.withAlpha(128), width: 50, height: 50,);

}