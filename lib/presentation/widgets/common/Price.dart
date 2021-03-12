import 'package:flutter/material.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/utils/Strings.dart';

class Price extends StatelessWidget {

  final BookInfoModel book;
  final double fontSize;
  Price(this.book, {this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: priceGradient ,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(book.isFree ? Strings.free : book.price, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: fontSize),)
    );
  }

  Gradient get priceGradient => book.isFree 
    ? LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent])
    : LinearGradient(colors: [Colors.red, Colors.amber]);

}