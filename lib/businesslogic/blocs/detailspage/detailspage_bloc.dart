import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:meta/meta.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

part 'detailspage_event.dart';
part 'detailspage_state.dart';

class DetailspageBloc extends Bloc<DetailspageEvent, DetailspageState> {
  DetailspageBloc() : super(DetailspageInitial()) {
    add(DetailspageShown());
  }

  BooksRepository get _booksRepository => KiwiContainer().resolve<BooksRepository>();

  @override
  Stream<DetailspageState> mapEventToState(DetailspageEvent event) async* {
    if (event is DetailspageShown) yield* _onShown();
  }

  Stream<DetailspageState> _onShown() async* {
    try {
      yield DetailspageLoadSuccess(await _booksRepository.getBookDetails());
    } catch (e) {
      yield DetailspageLoadFailure();
      addError(e);
    }
  }

}
