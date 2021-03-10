part of 'listpage_bloc.dart';

@immutable
abstract class ListpageEvent {}

class ListpageShown extends ListpageEvent {}

class ListpageItemClicked extends ListpageEvent {
  final BookInfoModel book;
  ListpageItemClicked(this.book);
}

