part of 'search_bloc.dart';

abstract class SearchState {}


class SearchInitial extends SearchState {}

class SearchSuccessHasMore extends SearchState {
  final List<BookInfoModel> books;
  SearchSuccessHasMore(this.books);
}
class SearchSuccessFinalPage extends SearchState {
  final List<BookInfoModel> books;
  SearchSuccessFinalPage(this.books);
}
class SearchFailed extends SearchState {}
