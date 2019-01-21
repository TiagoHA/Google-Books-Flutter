import 'dart:convert' show json;

import 'package:google_books/src/models/books_model.dart';
import 'package:google_books/src/providers/bloc_provider.dart';
import 'package:google_books/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  ApplicationBloc() {
    _search.stream.listen((search) {
      print('BLOC - search: $search');
    });
    _booksList.stream.listen((listBooks) {
      print('LISTBOOKS: ');
      print(json.encode(listBooks));
    });
    _loadMoreBooks.stream.listen((index) {
      print('INDEX BLOC: $index');
    });
  }
  final _repository = Repository();

  final _search = BehaviorSubject<String>(seedValue: '');
  Function(String) get changeSearch => _search.sink.add;
  Observable<String> get searchValue => _search.stream;

  final _booksList = PublishSubject<BooksModel>();
  Observable<BooksModel> get booksList => _booksList.stream;

  void fetchAllBooks() async {
    final BooksModel books =
        await _repository.fetchAllBooks(search: _search.value);
    _booksList.sink.add(books);
  }

  final _loadMoreBooks = PublishSubject<int>();
  Function(int) get loadMoreBooks => _loadMoreBooks.sink.add;

  void dispose() {
    _search.close();
    _booksList.close();
    _loadMoreBooks.close();
  }
}
