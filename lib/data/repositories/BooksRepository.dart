import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';

abstract class BooksRepository {

  Future<List<BookInfoModel>> getBooks();
  
  Future<DetailedBookInfoModel> getBookDetails();
  
}