part of 'mainpage_bloc.dart';

@immutable
abstract class MainpageState {}

class MainpageInitial extends MainpageState {}
class MainpageLoadInProgress extends MainpageState {}
class MainpageLoadSuccess extends MainpageState {
  final List<BookModel> books;
  MainpageLoadSuccess(this.books);
}
class MainpageLoadFailure extends MainpageState {}