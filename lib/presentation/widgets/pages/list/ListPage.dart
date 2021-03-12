import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/listpage/listpage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/presentation/utils/Strings.dart';
import 'package:molteo/presentation/widgets/BookListItem.dart';
import 'package:molteo/presentation/widgets/common/RetryButton.dart';

class ListPage extends StatelessWidget {

  ListpageBloc get listpageBloc => KiwiContainer().resolve<ListpageBloc>();

  @override
  Widget build(BuildContext context) {  
    return listOfBooks;
  }

  Widget get listOfBooks => BlocBuilder<ListpageBloc, ListpageState>(
    buildWhen: (previous, current) => !(current is ListpageClearSearch) && !(current is ListpageShowBookDetails),
    builder: (context, state) {
      if (state is SearchState) {
        if (state is SearchSuccessHasMore) return booksHasMore(state.books);
        if (state is SearchSuccessFinalPage) return books(state.books);
        if (state is SearchFailed) return booksFailedRetry(state.books);
        return Container(color: Colors.green);
      }
      
      if (state is ListpageInitial) return Center(child: CircularProgressIndicator());
      if (state is ListpageLoadSuccess) return books(state.books);
      if (state is ListpageLoadFailure) return RetryButton(() { listpageBloc.add(ListpageRetry()); });

      return Container(color: Colors.blue);
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
      listpageBloc.add(SearchRequestedMore());
      return Center(child: CircularProgressIndicator());
    }
  );

  Widget booksFailedRetry(List<BookInfoModel> data) => ListView.builder(
    itemCount: data.length+1,
    itemBuilder: (context, index) {
      if (index < data.length) return BookListItem(data[index]);
      return RetryButton(() { listpageBloc.add(SearchRetry()); });
    }
  );


}