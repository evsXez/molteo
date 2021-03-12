part of 'listpage_bloc.dart';

@immutable
abstract class ListpageEvent extends Equatable {
  @override List<Object> get props => [];
}

class ListpageShown extends ListpageEvent {}

class ListpageItemClicked extends ListpageEvent {
  final BookInfoModel book;
  ListpageItemClicked(this.book);
  @override List<Object> get props => [book];
}

class ListpageRetry extends ListpageEvent {}

abstract class SearchEvent extends ListpageEvent {}

class SearchCleared extends SearchEvent {}
class SearchRequested extends SearchEvent {
  final String request;
  SearchRequested(this.request);

  @override
  List<Object> get props => [request];
}

class SearchRequestedMore extends SearchEvent {
  final double salt;
  SearchRequestedMore() : salt = Random().nextDouble();
  @override List<Object> get props => [salt];
}

class SearchRetry extends SearchEvent {}


