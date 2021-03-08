import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

import 'data/repositories/BooksRepository.dart';
import 'data/repositories/dummy/BooksRepositoryDummy.dart';
import 'presentation/widgets/pages/main/MainPage.dart';

void main() {
  assemble();
  runApp(MainPage());
}

void assemble() {
  KiwiContainer().registerInstance<BooksRepository>(BooksRepositoryDummy());
}
