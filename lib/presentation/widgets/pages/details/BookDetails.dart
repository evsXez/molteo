import 'package:flutter/material.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';

class BookDetails extends StatelessWidget {

  final DetailedBookInfoModel book;
  BookDetails(this.book);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            authors,
            publisher,
            language,
            isbn10,
            pages,
            year,
            rating,
            description,
            pdf,
      ],);
  }


  Widget get authors => Text(book.authors ?? "");
  Widget get publisher => Text(book.publisher ?? "");
  Widget get language => Text(book.language ?? "");
  Widget get isbn10 => Text(book.isbn10 ?? "");
  Widget get pages => Text(book.pages ?? "");
  Widget get year => Text(book.year ?? "");
  Widget get rating => Text(book.rating ?? "");
  Widget get description => Text(book.desc ?? "");
  Widget get pdf => Column(
    children: book.pdf.map((it) => Text("${it.chapter}: ${it.url}")).toList(),
  );

}