import 'dart:async';
import 'package:meta/meta.dart';
import 'package:google_books/src/models/books_model.dart';

import 'api_provider.dart';

class Repository {
  final _apiProvider = ApiProvider();

  Future<BooksModel> fetchAllBooks(
          {@required String search, int index: 0, int maxResults: 40}) =>
      _apiProvider.fetchAllBooks(
          search: search, index: index, maxResults: maxResults);
}
