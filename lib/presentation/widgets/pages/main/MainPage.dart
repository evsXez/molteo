import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molteo/businesslogic/blocs/mainpage/mainpage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/navigation/Navigation.dart';
import 'package:molteo/presentation/widgets/BookListItem.dart';

import '../details/DetailsPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: BlocProvider(
          create: (context) => MainpageBloc(),
          child: listOfBooks,
        ),
      ),
    );
  }

  Widget get listOfBooks => BlocConsumer<MainpageBloc, MainpageState>(
    listener: (context, state) { if (state is MainpageOpenBookDetails) openDetails(state.book); },
    buildWhen: (previous, current) => current is MainpageInitial || current is MainpageLoadSuccess || current is MainpageLoadFailure,
    builder: (context, state) {
      if (state is MainpageInitial) return Center(child: CircularProgressIndicator());
      if (state is MainpageLoadSuccess) return books(state.books);
      if (state is MainpageLoadFailure) return Center(child: Text("ERROR"),);
      return Container(color: Colors.red);
    },
  );

  Widget books(List<BookInfoModel> data) => ListView(
    children: data.map((it) => BookListItem(it)).toList()
  );

  void openDetails(BookInfoModel book) {
    navigation.push(MaterialPageRoute(builder: (context) => DetailsPage(book),));
  }

}