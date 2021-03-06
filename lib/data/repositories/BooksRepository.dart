import 'package:molteo/data/models/BookModel.dart';

abstract class BooksRepository {

  Future<List<BookModel>> getBooks();

}