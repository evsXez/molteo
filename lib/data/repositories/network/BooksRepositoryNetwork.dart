import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';

class BooksRepositoryNetwork extends BooksRepository {
  
  @override
  Future<List<BookInfoModel>> getBooks() {
    throw UnimplementedError();
  }

  @override
  Future<DetailedBookInfoModel> getBookDetails() {
    throw UnimplementedError();
  }

}