part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

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


