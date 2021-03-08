part of 'mainpage_bloc.dart';

@immutable
abstract class MainpageEvent {}

class MainpageShown extends MainpageEvent {}

class MainpageBookClicked extends MainpageEvent {
  final BookInfoModel book;
  MainpageBookClicked(this.book);
}
