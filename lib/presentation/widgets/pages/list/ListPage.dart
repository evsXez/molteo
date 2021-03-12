import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/blocs/search/search_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/utils/Strings.dart';
import 'package:molteo/presentation/widgets/BookListItem.dart';
import 'package:molteo/presentation/widgets/common/RetryButton.dart';

class ListPage extends StatelessWidget {

  SearchBloc get searchBloc => KiwiContainer().resolve<SearchBloc>();
  ListpageBloc get listpageBloc => KiwiContainer().resolve<ListpageBloc>();

  @override
  Widget build(BuildContext context) {
    return listOfBooks;
  }

  Widget get listOfBooks => BlocBuilder<SearchBloc, SearchState>(
    builder: (context, searchState) => listBuilder(searchState)
  );
  
  Widget listBuilder(SearchState searchState) => BlocBuilder<ListpageBloc, ListpageState>(
    // buildWhen: (previous, current) => current is ListpageInitial || current is ListpageLoadSuccess || current is ListpageLoadFailure,
    builder: (context, listpageState) {
      //first
      if (listpageState is ListpageInitial) return Center(child: CircularProgressIndicator());
      if (listpageState is ListpageLoadSuccess) return books(listpageState.books);
      if (listpageState is ListpageLoadFailure) return RetryButton(() { listpageBloc.add(ListpageRetry()); });

      //second
      if (searchState is SearchSuccessHasMore) return booksHasMore(searchState.books);
      if (searchState is SearchSuccessFinalPage) return books(searchState.books);
      if (searchState is SearchFailed) return booksFailedRetry(searchState.books);

      return Container(color: Colors.red);
    },
  );

  Widget books(List<BookInfoModel> data) => data.isEmpty 
    ? Center(child: Text(Strings.label_no_results))
    : ListView(
      children: data.map((it) => BookListItem(it)).toList()
    );

  Widget booksHasMore(List<BookInfoModel> data) => ListView.builder(
    itemCount: data.length+1,
    itemBuilder: (context, index) {
      if (index < data.length) return BookListItem(data[index]);
      searchBloc.add(SearchRequestedMore());
      return Center(child: CircularProgressIndicator());
    }
  );

  Widget booksFailedRetry(List<BookInfoModel> data) => ListView.builder(
    itemCount: data.length+1,
    itemBuilder: (context, index) {
      if (index < data.length) return BookListItem(data[index]);
      return RetryButton(() { searchBloc.add(SearchRetry()); });
    }
  );


}