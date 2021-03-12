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

class ListpageRetryPressed extends ListpageEvent {}

abstract class SearchEvent extends ListpageEvent {}

///User cleared search field
class SearchCleared extends SearchEvent {}

///User typed somth in search field
class SearchRequested extends SearchEvent {
  final String request;
  SearchRequested(this.request);

  @override
  List<Object> get props => [request];
}

///User scrolled down the list
class SearchRequestedMore extends SearchEvent {
  final double salt;
  SearchRequestedMore() : salt = Random().nextDouble();
  @override List<Object> get props => [salt];
}

///User pressed got error loading next pages, pressed retry button
class SearchRetryPressed extends SearchEvent {}


