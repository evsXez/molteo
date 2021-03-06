import 'package:molteo/data/models/BookModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

class BooksRepositoryNetwork extends BooksRepository {
  
  @override
  Future<List<BookModel>> getBooks() {
    throw UnimplementedError();
  }

}