import 'package:molteo/data/models/BookModel.dart';

import '../BooksRepository.dart';

class BooksRepositoryDummy extends BooksRepository {
  
  final List<BookModel> dummyList = List.generate(5, (index) => BookModel("Book #$index"));

  @override
  Future<List<BookModel>> getBooks() {
    return Future.delayed(Duration(seconds: 3), () => dummyList);
  }

}