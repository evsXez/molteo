import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/models/SearchResponsePortion.dart';

abstract class BooksRepository {

  Future<SearchResponsePortion<BookInfoModel>> searchBooks(String request, int page);
 
  Future<List<BookInfoModel>> getNewBooks();
  
  Future<DetailedBookInfoModel> getBookDetails(String isbn13);
  
}