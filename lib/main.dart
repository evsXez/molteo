import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:molteo/presentation/widgets/pages/main/MainPage.dart';

import 'data/repositories/BooksRepository.dart';
import 'data/repositories/dummy/BooksRepositoryDummy.dart';

void main() {
  assemble();
  runApp(MainPage());
}

void assemble() {
  KiwiContainer().registerInstance<BooksRepository>(BooksRepositoryDummy());
}
