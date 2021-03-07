import 'dart:convert';

import 'package:molteo/data/models/BookModel.dart';

import '../BooksRepository.dart';

class BooksRepositoryDummy extends BooksRepository {
  
  List<BookModel> dummyList() {
    final obj = json.decode(_DUMMY_DATA);
    final List<dynamic> books = obj['books'];
    return books.map((it) => BookModel.fromJson(it)).toList();
  }

  @override
  Future<List<BookModel>> getBooks() {
    return Future.delayed(Duration(seconds: 2), () => dummyList());
  }

}


const _DUMMY_DATA = r'''
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
		},
		{
			"title": "Operating Systems: From 0 to 1",
			"subtitle": "",
			"isbn13": "1001606140658",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001606140658.png",
			"url": "https://itbook.store/books/1001606140658"
		},
		{
			"title": "Java Web Scraping Handbook",
			"subtitle": "Learn advanced Web Scraping techniques",
			"isbn13": "1001606140805",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001606140805.png",
			"url": "https://itbook.store/books/1001606140805"
		},
		{
			"title": "Coffee Break Python Slicing",
			"subtitle": "24 Workouts to Master Slicing in Python, Once and for All",
			"isbn13": "1001605784161",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001605784161.png",
			"url": "https://itbook.store/books/1001605784161"
		},
		{
			"title": "The Basics of User Experience Design",
			"subtitle": "",
			"isbn13": "1001601301730",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001601301730.png",
			"url": "https://itbook.store/books/1001601301730"
		},
		{
			"title": "3D Game Development with LWJGL 3",
			"subtitle": "Learn the main concepts involved in writing 3D games using the Lighweight Java Gaming Library",
			"isbn13": "1001601302020",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001601302020.png",
			"url": "https://itbook.store/books/1001601302020"
		},
		{
			"title": "DevOps: WTF?",
			"subtitle": "",
			"isbn13": "1001592565453",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001592565453.png",
			"url": "https://itbook.store/books/1001592565453"
		},
		{
			"title": "Full Speed Python",
			"subtitle": "",
			"isbn13": "1001592395975",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001592395975.png",
			"url": "https://itbook.store/books/1001592395975"
		},
		{
			"title": "How To Code in Python 3",
			"subtitle": "",
			"isbn13": "9780999773017",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/9780999773017.png",
			"url": "https://itbook.store/books/9780999773017"
		},
		{
			"title": "Operating System Concepts, 10th Edition",
			"subtitle": "",
			"isbn13": "9781119456339",
			"price": "$90.08",
			"image": "https://itbook.store/img/books/9781119456339.png",
			"url": "https://itbook.store/books/9781119456339"
		},
		{
			"title": "Neural Networks and Deep Learning",
			"subtitle": "A Textbook",
			"isbn13": "9783319944623",
			"price": "$33.99",
			"image": "https://itbook.store/img/books/9783319944623.png",
			"url": "https://itbook.store/books/9783319944623"
		},
		{
			"title": "Fundamentals of C++ Programming",
			"subtitle": "",
			"isbn13": "1001590483252",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001590483252.png",
			"url": "https://itbook.store/books/1001590483252"
		},
		{
			"title": "Fundamentals of Python Programming",
			"subtitle": "",
			"isbn13": "1001590485785",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001590485785.png",
			"url": "https://itbook.store/books/1001590485785"
		},
		{
			"title": "Machine Learning Yearning",
			"subtitle": "Technical Strategy for AI Engineers, In the Era of Deep Learning",
			"isbn13": "1001590486081",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001590486081.png",
			"url": "https://itbook.store/books/1001590486081"
		},
		{
			"title": "React in patterns",
			"subtitle": "",
			"isbn13": "1001590486262",
			"price": "$0.00",
			"image": "https://itbook.store/img/books/1001590486262.png",
			"url": "https://itbook.store/books/1001590486262"
		}
	]
}
''';