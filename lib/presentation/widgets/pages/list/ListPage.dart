import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/blocs/search/search_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/widgets/BookListItem.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return listOfBooks;
  }

  Widget get listOfBooks => BlocBuilder<SearchBloc, SearchState>(
    builder: (context, state) {
      if (state is SearchSuccessHasMore) return booksHasMore(state.books);
      if (state is SearchSuccessFinalPage) return books(state.books);
      return listBuilder;
    }
  );
  
  Widget get listBuilder => BlocBuilder<ListpageBloc, ListpageState>(
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

  Widget booksHasMore(List<BookInfoModel> data) => ListView.builder(
    itemCount: data.length+1,
    itemBuilder: (context, index) {
      if (index < data.length) return BookListItem(data[index]);
      KiwiContainer().resolve<SearchBloc>().add(SearchRequestedMore());
      return Center(child: CircularProgressIndicator());
    }
  );


}