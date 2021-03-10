import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';
import 'package:dio/dio.dart';

class BooksRepositoryNetwork extends BooksRepository {

  Dio _dio;

  BooksRepositoryNetwork() {
    BaseOptions options = BaseOptions(
        baseUrl: "https://api.itbook.store/1.0",
        connectTimeout: 5000,
        receiveTimeout: 3000,
    );
    _dio = Dio(options);
  }
  
  @override
  Future<List<BookInfoModel>> getNewBooks() async {
    try {
      final response = await _dio.get("/new");
      return _parseBooks(response.data);
    } catch (e) { rethrow; }
  }

  @override
  Future<DetailedBookInfoModel> getBookDetails(String isbn13) async {
    try {
      final response = await _dio.get("/books/$isbn13");
      return _parseBookDetails(response.data);
    } catch (e) { rethrow; }
  }

  List<BookInfoModel> _parseBooks(Map<dynamic, dynamic> obj) {
    final List<dynamic> books = obj['books'];
    return books.map((it) => BookInfoModel.fromJson(it)).toList();
  }

  DetailedBookInfoModel _parseBookDetails(Map<dynamic, dynamic> obj) => DetailedBookInfoModel.fromJson(obj);

}