import 'dart:collection';

import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/models/SearchResponsePortion.dart';
import 'package:molteo/data/repositories/BooksRepository.dart';
import 'package:dio/dio.dart';

class BooksRepositoryNetwork extends BooksRepository {

  final _cache = HashMap<String, DetailedBookInfoModel>();

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
  Future<SearchResponsePortion<BookInfoModel>> searchBooks(String request, int page) async {
    try {
      final modifiedRequest = request; //TODO: remove spaces/add quotes/...
      final response = await _dio.get("/search/$modifiedRequest/$page");
      final list = _parseBooks(response.data);
      final hasMore = !list.isEmpty;//response.total > 
      return SearchResponsePortion(list, hasMore);
    } catch (e) { rethrow; }
  }

  @override
  Future<DetailedBookInfoModel> getBookDetails(String isbn13) async {
    if (_cache.containsKey(isbn13)) return _cache[isbn13];
    try {
      final response = await _dio.get("/books/$isbn13");
      final result = _parseBookDetails(response.data);
      _cache.addAll({isbn13: result});
      return result;
    } catch (e) { rethrow; }
  }

  List<BookInfoModel> _parseBooks(Map<dynamic, dynamic> obj) {
    final List<dynamic> books = obj['books'];
    return books.map((it) => BookInfoModel.fromJson(it)).toList();
  }

  DetailedBookInfoModel _parseBookDetails(Map<dynamic, dynamic> obj) => DetailedBookInfoModel.fromJson(obj);
}