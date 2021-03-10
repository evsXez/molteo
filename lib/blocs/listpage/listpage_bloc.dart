import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:meta/meta.dart';
import 'package:molteo/blocs/detailspage/detailspage_bloc.dart';
import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

part 'listpage_event.dart';
part 'listpage_state.dart';

class ListpageBloc extends Bloc<ListpageEvent, ListpageState> {


  ListpageBloc() : super(ListpageInitial()) {
    add(ListpageShown());
  }

  BooksRepository get _booksRepository => KiwiContainer().resolve<BooksRepository>();
  DetailspageBloc get detailspageBloc => KiwiContainer().resolve<DetailspageBloc>();

  @override
  Stream<ListpageState> mapEventToState(ListpageEvent event) async* {
    if (event is ListpageShown) yield* _onShown();
    if (event is ListpageItemClicked) {
      yield ListpageShowBookDetails(event.book);
      detailspageBloc.add(DetailspageShown(event.book));
    }
  }

  Stream<ListpageState> _onShown() async* {
    try {
      yield ListpageLoadSuccess(await _booksRepository.getBooks());
    } catch (e) {
      yield ListpageLoadFailure();
      addError(e);
    }
  }

}
