import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/blocs/detailspage/detailspage_bloc.dart';
import 'package:molteo/data/repositories/network/BooksRepositoryNetwork.dart';
import 'package:molteo/dev/SimpleBlocObserver.dart';

import 'blocs/listpage/listpage_bloc.dart';
import 'data/repositories/BooksRepository.dart';
import 'presentation/widgets/pages/main/MainPage.dart';

void main() {
  debug();
  assemble();
  runApp(MainPage());
}

void debug() {
  Bloc.observer = SimpleBlocObserver(); //observer for logging events/states of Blocs
}

///Instantiates dependencies for DI container (KiwiContainer)
void assemble() {
  // KiwiContainer().registerInstance<BooksRepository>(BooksRepositoryDummy());
  KiwiContainer().registerInstance<BooksRepository>(BooksRepositoryNetwork());

  KiwiContainer().registerInstance<ListpageBloc>(ListpageBloc());
  KiwiContainer().registerInstance<DetailspageBloc>(DetailspageBloc());
}
