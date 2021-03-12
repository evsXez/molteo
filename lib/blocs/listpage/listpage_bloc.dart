import 'dart:async';
import 'dart:math';

import 'package:stream_transform/stream_transform.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:meta/meta.dart';
import 'package:molteo/blocs/detailspage/detailspage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

part 'listpage_event.dart';
part 'listpage_state.dart';

class ListpageBloc extends Bloc<ListpageEvent, ListpageState> {

  final _searchData = _SearchData<BookInfoModel>();


  @override
  Stream<Transition<ListpageEvent, ListpageState>> transformEvents(Stream<ListpageEvent> events, transitionFn) {
   return events
        .where((event) => (event is SearchRequested) ? event.request.length >= 3 : true)
        .debounce(const Duration(milliseconds: 300)) //TODO: affects all events
        // .distinct()
        .switchMap((transitionFn));
  }

  ListpageBloc() : super(ListpageInitial()) {
    add(ListpageShown());
  }

  BooksRepository get _booksRepository => KiwiContainer().resolve<BooksRepository>();
  DetailspageBloc get detailspageBloc => KiwiContainer().resolve<DetailspageBloc>();


  @override
  Stream<ListpageState> mapEventToState(ListpageEvent event) async* {
    if (event is SearchRequested) yield* _onSearch(event.request);
    if (event is SearchRequestedMore) yield* _onSearchMore();
    if (event is SearchRetry) yield* _onSearchRetry();

    if (event is ListpageShown) yield* _onShown();
    if (event is ListpageItemClicked) {
      yield ListpageShowBookDetails(event.book);
      detailspageBloc.add(DetailspageShown(event.book));
    }
    if (event is ListpageRetry) yield* _onRetry();
    if (event is SearchCleared) yield* _onShown(clear: false);
  }

  Stream<ListpageState> _onShown({bool clear = true}) async* {
    try {
      if (clear) yield ListpageClearSearch();
      yield ListpageLoadSuccess(await _booksRepository.getNewBooks());
    } catch (e) {
      yield ListpageLoadFailure();
      addError(e);
    }
  }

  Stream<ListpageState> _onRetry() async* {
    yield ListpageInitial();
    add(ListpageShown());
  }

  Stream<SearchState> _onSearch(String request) async* {
    if (_searchData.request == request) return;

    try {
      print("== onSearch: $request");
      _searchData.request = request;
      _searchData.page = 0;
      _searchData.data.clear();
      final searchPortion = await _booksRepository.searchBooks(_searchData.request, _searchData.page);
      _searchData.data = searchPortion.data;
      if (searchPortion.hasMore)
        yield SearchSuccessHasMore(_searchData.data);
      else
        yield SearchSuccessFinalPage(_searchData.data);
    } catch (e) {
      yield SearchFailed(_searchData.data);
      addError(e);
    }
  }

  Stream<SearchState> _onSearchMore() async* {
    try {
      final searchPortion = await _booksRepository.searchBooks(_searchData.request, _searchData.page++);
      _searchData.data.addAll(searchPortion.data);
      if (searchPortion.hasMore)
        yield SearchSuccessHasMore(_searchData.data);
      else
        yield SearchSuccessFinalPage(_searchData.data);
    } catch (e) {
      yield SearchFailed(_searchData.data);
      addError(e);
    }
  }

  Stream<SearchState> _onSearchRetry() async* {
    yield SearchSuccessHasMore(_searchData.data);
  }

}



class _SearchData<T> {
  String request;
  int page;
  List<T> data = [];
}