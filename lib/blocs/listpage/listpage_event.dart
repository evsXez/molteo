part of 'listpage_bloc.dart';

@immutable
abstract class ListpageEvent {
  // @override List<Object> get props => [];
}

class ListpageShown extends ListpageEvent {}

class ListpageItemClicked extends ListpageEvent {
  final BookInfoModel book;
  ListpageItemClicked(this.book);
  // @override List<Object> get props => [book];
}

class ListpageRetry extends ListpageEvent {}
