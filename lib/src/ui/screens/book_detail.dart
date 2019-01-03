import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_books/src/models/books_model.dart';

class BookDetail extends StatelessWidget {
  BookDetail({@required this.book});

  final Item book;

  @override
  Widget build(BuildContext context) {
    print('BOOK');
    print(json.encode(book.volumeInfo));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text('Book Detail'),
        ),
        body: Container(child: Text('texto')),
      ),
    );
  }
}
