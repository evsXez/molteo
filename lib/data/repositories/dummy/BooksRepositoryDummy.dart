import 'dart:convert';

import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';
import 'package:molteo/data/models/SearchResponsePortion.dart';

import '../BooksRepository.dart';

///Dummy class for development purposes
class BooksRepositoryDummy extends BooksRepository {
  
  List<BookInfoModel> _dummyList() {
    final obj = json.decode(_DUMMY_LIST);
    final List<dynamic> books = obj['books'];
    return books.map((it) => BookInfoModel.fromJson(it)).toList();
  }

  @override
  Future<List<BookInfoModel>> getNewBooks() {
    return Future.delayed(Duration(seconds: 2), () {
      // throw 'test';
      return _dummyList();
      }
    );
  }

  @override
  Future<DetailedBookInfoModel> getBookDetails(String isbn13) {
    return Future.delayed(Duration(seconds: 2), () {
      // throw 'test';
      return DetailedBookInfoModel.fromJson(json.decode(_DUMMY_DETAILS));
    }
    );
  }

  @override
  Future<SearchResponsePortion<BookInfoModel>> searchBooks(String request, int page) async {
    print("??? page: $page");
    return Future.delayed(Duration(seconds: 2), () {
      // throw 'test';
      return SearchResponsePortion(_dummyList(), true);
    });
  }


}


const _DUMMY_DETAILS = r'''
{
	"error": "0",
	"title": "Securing DevOps",
	"subtitle": "Security in the Cloud",
	"authors": "Julien Vehent",
	"publisher": "Manning",
	"language": "English",
	"isbn10": "1617294136",
	"isbn13": "9781617294136",
	"pages": "384",
	"year": "2018",
	"rating": "5",
	"desc": "An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team's highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your cloud ...",
	"price": "$39.99",
	"image": "https://itbook.store/img/books/9781617294136.png",
	"url": "https://itbook.store/books/9781617294136",
	"pdf": {
		"Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
		"Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
	}
}
''';

const _DUMMY_LIST = r'''
{
	"error": "0",
	"total": "20",
	"books": [
		{
			"title": "The Node.js Handbook",
			"subtitle": "",
			"isbn13": "1001614599609",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001614599609.png",
			"url": "https://itbook.store/books/1001614599609"
		},
		{
			"title": "Azure Tips and Tricks",
			"subtitle": "",
			"isbn13": "9781732704121",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/9781732704121.png",
			"url": "https://itbook.store/books/9781732704121"
		},
		{
			"title": "Learn Programming",
			"subtitle": "Your Guided Tour Through the Programming Jungle",
			"isbn13": "9781722834920",
			"price": "$16.83",
			"image": "https://itbook.store/img/books/9781722834920.png",
			"url": "https://itbook.store/books/9781722834920"
		}
	]
}
''';