part of 'mainpage_bloc.dart';

@immutable
abstract class MainpageState {}

class MainpageInitial extends MainpageState {}
class MainpageLoadSuccess extends MainpageState {
  final List<BookInfoModel> books;
  MainpageLoadSuccess(this.books);
}
class MainpageLoadFailure extends MainpageState {}
class MainpageOpenBookDetails extends MainpageState {
  final BookInfoModel book;
  MainpageOpenBookDetails(this.book);
}
