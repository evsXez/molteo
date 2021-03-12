import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/detailspage/detailspage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/utils/Strings.dart';
import 'package:molteo/presentation/utils/Utils.dart';
import 'package:molteo/presentation/widgets/common/Price.dart';
import 'package:molteo/presentation/widgets/common/RetryButton.dart';
import 'BookDetails.dart';

class DetailsPage extends StatelessWidget {

  final BookInfoModel book;
  DetailsPage(this.book);

  DetailspageBloc get detailspageBloc => KiwiContainer().resolve<DetailspageBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: book == null 
          ? placeholder
          : Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Utils.isWide(context) ? layoutWide : layoutTight),
        ),
    );
  }

  Widget get layoutTight => ListView(
      children: [
        Center(child: image),
        Center(child: price),
        SizedBox(height: 16),
        title,
        subtitle,
        SizedBox(height: 8),
        isbn13,
        details,
      ],
    );

  Widget get layoutWide => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ListView(
                  children: [
                    SizedBox(height: 16),
                    title,
                    subtitle,
                    SizedBox(height: 8),
                    isbn13,
                    details,
                  ],
                )),
              Expanded(child: Column(
                children: [
                  image,
                  price,
                ],
              )),
            ],
          ); 

  Widget get placeholder => Center(child: Text(Strings.hint_select_a_book, style: TextStyle(fontSize: 18, color: Colors.grey)),);

  Widget get title => Text(book.title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22,), );
  Widget get subtitle => book.subtitle.isEmpty 
    ? SizedBox.shrink()
    : Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(book.subtitle, style: TextStyle(color: Colors.grey),),
    );

  Widget get isbn13 => Text("ISBN: ${book.isbn13}");

  Widget get image {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 16, spreadRadius: 4, color: Colors.black.withAlpha(80), offset: Offset(8, 0))]
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(angle: -pi/4.0, child: Center(child: Text(Strings.image_placeholder, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))),
            Transform.scale(scale: 1.2, child: GestureDetector(onTap: onTap, child: Image.network(book.image,))),
          ]
        ),
      );
  }

  Widget get details => BlocBuilder<DetailspageBloc, DetailspageState>(
    cubit: detailspageBloc,
    builder: (context, state) {
      if (state is DetailspageInitial) return progress;
      if (state is DetailspageLoadFailure) return RetryButton(() => detailspageBloc.add(DetailspageRetryPressed()));
      if (state is DetailspageLoadSuccess) return BookDetails(state.bookDetails);
      return Container(color: Colors.red);
    }
  );

  Widget get price => GestureDetector(onTap: onTap, child: Price(book, fontSize: 22));
  Widget get progress => Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: LinearProgressIndicator(),);

  void onTap() => launchURL(book.url);


}