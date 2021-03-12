import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/detailspage/detailspage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
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
          : Column(
              children: [
                title,
                subtitle,
                isbn13,
                price,
                image,
                details,
              ],
            ),
        ),
    );
  }

  Widget get placeholder => Center(child: Text("PLACEHOLDER"),);

  Widget get title => Text(book.title);
  Widget get subtitle => Text(book.subtitle);
  Widget get isbn13 => Text("ISBN-13: " + book.isbn13);
  Widget get price => Text(book.price);
  Widget get image => Image.network(book.image, width: 120, height: 120);

  Widget get details => BlocBuilder<DetailspageBloc, DetailspageState>(
    cubit: detailspageBloc,
    builder: (context, state) {
      if (state is DetailspageInitial) return CircularProgressIndicator();
      if (state is DetailspageLoadFailure) return RetryButton(() => detailspageBloc.add(DetailspageRetry()));
      if (state is DetailspageLoadSuccess) return BookDetails(state.bookDetails);
      return Container(color: Colors.red);
    }
  );



}