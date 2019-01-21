import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_books/src/models/books_model.dart';

class BookDetail extends StatelessWidget {
  BookDetail({@required this.book});

  final Item book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text('Book Detail'),
        ),
        body: ListView(children: <Widget>[
          Container(

            padding: EdgeInsets.all(10),
            color: Colors.yellow,
            child: Column(children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Hero(
                        tag: book.id,
                        child:
                            Image.network(book.volumeInfo.imageLinks.thumbnail),
                      ),
                      Text('${book.volumeInfo?.pageCount ?? 0} pages'),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(book.volumeInfo.title),
                            Text(
                                'by ${book.volumeInfo?.authors.toString() ?? 'No authors'}'),
                            Row(
                              children: <Widget>[
                                Text(
                                    '\$ ${book.saleInfo?.listPrice?.amount ?? 0.0}'),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star),
                                    Icon(Icons.star_border)
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(),
                            ),
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Text('Buy'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 100),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(book.volumeInfo.description),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
