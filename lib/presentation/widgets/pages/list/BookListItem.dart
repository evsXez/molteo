import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/utils/Strings.dart';
import 'package:molteo/presentation/widgets/common/Price.dart';

class BookListItem extends StatelessWidget {

  final BookInfoModel book;
  BookListItem(this.book);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title,
                          subtitle,
                          SizedBox(height: 8),
                          Align(alignment: Alignment.centerRight, child: price),
                        ]
                      ),
                    ]
                  ),
                ),
              )
            ),
          ],
        )),
      ],
    );
  }


  Widget get title => Text(book.title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18,), maxLines: 2, overflow: TextOverflow.ellipsis,);

  Widget get subtitle => book.subtitle.isEmpty 
    ? SizedBox.shrink()
    : Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(book.subtitle, style: TextStyle(color: Colors.grey), maxLines: 3, overflow: TextOverflow.ellipsis,),
    );

  Widget get price => Price(book);

  Widget get image {
    final k = 4.0;
    final double W = 30*k;
    final double H = 35*k;
    return Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 16, spreadRadius: 4, color: Colors.black.withAlpha(80), offset: Offset(8, 0))]
        ),
        height: H,
        width: W,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(angle: -pi/4.0, child: Center(child: Text(Strings.image_placeholder, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))),
            Transform.scale(scale: 1.2, child: GestureDetector(onTap: onTap, child: Image.network(book.image,))),
          ]
        ),
      );
  }

  void onTap() => KiwiContainer().resolve<ListpageBloc>().add(ListpageItemClicked(book));

}