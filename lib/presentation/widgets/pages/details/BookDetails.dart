import 'package:flutter/material.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/presentation/utils/Strings.dart';
import 'package:molteo/presentation/utils/Utils.dart';
import 'package:molteo/presentation/widgets/common/LabeledText.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class BookDetails extends StatelessWidget {

  final DetailedBookInfoModel book;
  BookDetails(this.book);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            SizedBox(height: 8),
            authors,
            publisher,
            language,
            pages,
            year,
            rating,
            SizedBox(height: 8),
            description,
            SizedBox(height: 8),
            pdf,
      ],);
  }


  Widget get authors => LabeledText(Strings.label_authors, book.authors);
  Widget get publisher => LabeledText(Strings.label_publisher, book.publisher);
  Widget get language => LabeledText(Strings.label_language, book.language);
  Widget get pages => LabeledText(Strings.label_pages, book.pages);
  Widget get year => LabeledText(Strings.label_year, book.year);
  Widget get rating => LabeledText(Strings.label_rating, stars(book.rating));
  Widget get description => Text(book.desc ?? "");
  Widget get pdf => Column(
    children: book.pdf.map((it) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Linkify(
        onOpen: (link) { launchURL(link.url); },
        text: "${it.chapter}: ${it.url}",
      ),
    )).toList(),
  );

  String stars(String rating) => List.generate(int.parse(rating), (_) => "⭐").join();


}