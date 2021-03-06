import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:meta/meta.dart';
import 'package:molteo/data/models/BookModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  MainpageBloc() : super(MainpageInitial()) {
    add(MainpageShown());
  }

  BooksRepository get booksRepository => KiwiContainer().resolve<BooksRepository>();

  @override
  Stream<MainpageState> mapEventToState(MainpageEvent event) async* {
    if (event is MainpageShown) yield* _onShown();
  }

  Stream<MainpageState> _onShown() async* {
    try {
      yield MainpageLoadSuccess(await booksRepository.getBooks());
    } catch (e) {
      yield MainpageLoadFailure();
      addError(e);
    }
  }

}
