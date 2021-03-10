import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/widgets/BookListItem.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listOfBooks,
      );
  }

  Widget get listOfBooks => BlocBuilder<ListpageBloc, ListpageState>(
    buildWhen: (previous, current) => current is ListpageInitial || current is ListpageLoadSuccess || current is ListpageLoadFailure,
    builder: (context, state) {
      if (state is ListpageInitial) return Center(child: CircularProgressIndicator());
      if (state is ListpageLoadSuccess) return books(state.books);
      if (state is ListpageLoadFailure) return Center(child: Text("ERROR"),);
      return Container(color: Colors.red);
    },
  );

  Widget books(List<BookInfoModel> data) => ListView(
    children: data.map((it) => BookListItem(it)).toList()
  );


}