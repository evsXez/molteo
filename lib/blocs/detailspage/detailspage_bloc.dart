import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:meta/meta.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

part 'detailspage_event.dart';
part 'detailspage_state.dart';

class DetailspageBloc extends Bloc<DetailspageEvent, DetailspageState> {
  DetailspageBloc() : super(DetailspageInitial());

  BookInfoModel _currentBook;

  BooksRepository get _booksRepository => KiwiContainer().resolve<BooksRepository>();

  @override
  Stream<DetailspageState> mapEventToState(DetailspageEvent event) async* {
    if (event is DetailspageShown) yield* _onShown(event.book);
    if (event is DetailspageRetryPressed) yield* _onShown(_currentBook);
  }

  Stream<DetailspageState> _onShown(BookInfoModel book) async* {
    try {
      _currentBook = book;
      yield DetailspageInitial();
      yield DetailspageLoadSuccess(await _booksRepository.getBookDetails(book.isbn13));
    } catch (e) {
      yield DetailspageLoadFailure();
      addError(e);
    }
  }

}
