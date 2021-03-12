part of 'listpage_bloc.dart';

@immutable
abstract class ListpageState {}

class ListpageInitial extends ListpageState {}
class ListpageClearSearch extends ListpageState {}
class ListpageLoadSuccess extends ListpageState {
  final List<BookInfoModel> books;
  ListpageLoadSuccess(this.books);
}
class ListpageLoadFailure extends ListpageState {}

class ListpageShowBookDetails extends ListpageState {
  final BookInfoModel book;
  ListpageShowBookDetails(this.book);
}

abstract class SearchState extends ListpageState {}

class SearchInitial extends SearchState {}

class SearchSuccessHasMore extends SearchState {
  final List<BookInfoModel> books;
  SearchSuccessHasMore(this.books);
}
class SearchSuccessFinalPage extends SearchState {
  final List<BookInfoModel> books;
  SearchSuccessFinalPage(this.books);
}
class SearchFailed extends SearchState {
  final List<BookInfoModel> books;
  SearchFailed(this.books);
}
