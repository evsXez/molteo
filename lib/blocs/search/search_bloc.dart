import 'dart:async';
import 'dart:math';

import 'package:kiwi/kiwi.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:molteo/data/models/BookInfoModel.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  final _searchData = _SearchData<BookInfoModel>();

  BooksRepository get _booksRepository => KiwiContainer().resolve<BooksRepository>();

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(Stream<SearchEvent> events, transitionFn) {
   return events
        .where((event) => (event is SearchRequested) ? event.request.length >= 3 : true)
        .debounce(const Duration(milliseconds: 300))
        // .distinct()
        .switchMap((transitionFn));
  }


  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchRequested) yield* _onSearch(request: event.request);
    if (event is SearchRequestedMore) yield* _onSearch(isFirstPage: false);
  }

  Stream<SearchState> _onSearch({String request, bool isFirstPage = true}) async* {
    if (isFirstPage && _searchData.request == request) return;
    try {
      if (isFirstPage) {
        print("== onSearch: $request");
        _searchData.request = request;
        _searchData.page = 0;
        _searchData.data.clear();
      } else {
        _searchData.page++;
      }
      final searchPortion = await _booksRepository.searchBooks(_searchData.request, _searchData.page);
      _searchData.data.addAll(searchPortion.data);
      if (searchPortion.hasMore)
        yield SearchSuccessHasMore(_searchData.data);
      else
        yield SearchSuccessFinalPage(_searchData.data);
    } catch (e) {
      yield SearchFailed();
      addError(e);
    }
  }

}

class _SearchData<T> {
  String request;
  int page;
  List<T> data = [];
}