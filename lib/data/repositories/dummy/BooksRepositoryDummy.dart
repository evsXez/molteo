import 'dart:convert';

import 'package:molteo/data/models/BookInfoModel.dart';
import 'package:molteo/data/models/DetailedBookInfoModel.dart';

import '../BooksRepository.dart';

class BooksRepositoryDummy extends BooksRepository {
  
  List<BookInfoModel> dummyList() {
    final obj = json.decode(_DUMMY_LIST);
    final List<dynamic> books = obj['books'];
    return books.map((it) => BookInfoModel.fromJson(it)).toList();
  }

  @override
  Future<List<BookInfoModel>> getNewBooks() {
    return Future.delayed(Duration(seconds: 2), () => dummyList());
  }

  @override
  Future<DetailedBookInfoModel> getBookDetails(String isbn13) {
    return Future.delayed(Duration(seconds: 2), () =>
      DetailedBookInfoModel.fromJson(json.decode(_DUMMY_DETAILS))
    );
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
		},
		{
			"title": "Graph Databases For Beginners",
			"subtitle": "The #1 Platform for Connected Data",
			"isbn13": "1001606307637",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001606307637.png",
			"url": "https://itbook.store/books/1001606307637"
		},
		{
			"title": "Elementary Algorithms",
			"subtitle": "",
			"isbn13": "1001606307729",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001606307729.png",
			"url": "https://itbook.store/books/1001606307729"
		},
		{
			"title": "Windows PowerShell Networking Guide",
			"subtitle": "",
			"isbn13": "1001606307964",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001606307964.png",
			"url": "https://itbook.store/books/1001606307964"
		}
	]
}
''';