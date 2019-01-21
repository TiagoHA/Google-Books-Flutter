import 'dart:async';
import 'package:dio/dio.dart';
import 'package:google_books/src/models/books_model.dart';
import 'package:meta/meta.dart';

class ApiProvider {
  static final options = Options(
      baseUrl: "https://www.googleapis.com/books/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000);
  static final dio = Dio(options);

  Future<BooksModel> fetchAllBooks(
      {@required String search, int maxResults: 39, int index: 0}) async {
    if (maxResults > 39) {
      print('MaxResult max 39');
      throw Exception('MaxResult is over 39 books');
    }

    final link =
        "/volumes?q=\${$search}&maxResults=$maxResults&startIndex=$index";
    final response = await dio.get(link);

    if (response.statusCode == 200) {
      return BooksModel.fromJson(response.data);
    }
    throw Exception('Failed to load books');
  }
}

// https://www.googleapis.com/books/v1/volumes?q=${harry%20pot}&maxResults=39&startIndex=0
// final newSearch = search.replaceAll(' ', '%20');
