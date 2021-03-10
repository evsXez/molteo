part of 'listpage_bloc.dart';

@immutable
abstract class ListpageState {}

class ListpageInitial extends ListpageState {}
class ListpageLoadSuccess extends ListpageState {
  final List<BookInfoModel> books;
  ListpageLoadSuccess(this.books);
}
class ListpageLoadFailure extends ListpageState {}

class ListpageShowBookDetails extends ListpageState {
  final BookInfoModel book;
  ListpageShowBookDetails(this.book);
}
