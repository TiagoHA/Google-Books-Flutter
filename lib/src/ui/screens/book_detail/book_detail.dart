import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_books/src/models/books_model.dart';
import 'package:google_books/src/ui/screens/book_detail/widgets/rating-widget.dart';

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
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag: book.id,
                              child: Image.network(
                                  book.volumeInfo.imageLinks.thumbnail),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                book.volumeInfo.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto-Bold',
                                    fontSize: book.volumeInfo.title.length < 40
                                        ? 25
                                        : 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'by ${book.volumeInfo?.authors.toString() ?? 'No authors'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto-Medium',
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '\$ ${book.saleInfo?.listPrice?.amount ?? 0.0}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Roboto-Bold',
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Rating(
                                    rate: book.volumeInfo.averageRating,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${book.volumeInfo?.pageCount ?? 0} pages',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto-Regular',
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      RaisedButton(
                        color: Colors.blue,
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
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 60),
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
