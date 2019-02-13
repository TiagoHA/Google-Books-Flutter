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
                                        ? 20
                                        : 18),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'by ${book.volumeInfo?.authors.toString() ?? 'No authors'}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto-Medium',
                                    fontSize: 14,
                                    color: subTitleColor),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '\$ ${book.saleInfo?.listPrice?.amount ?? 0.0}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto-Bold',
                                      fontSize: 20,
                                    ),
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
                            fontFamily: 'Roboto-Normal',
                            color: subTitleColor,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      RaisedButton(
                        color: const Color(0xFF4A90E2),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 20,
                          ),
                          backgroundColor: Colors.redAccent,
                          onPressed: () => {},
                        ),
                      ),
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
                  child: Text(
                    book.volumeInfo.description,
                    style: TextStyle(color: Color(0xFF4F565D), height: 1.5),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

const subTitleColor = Color(0xFF9F8B0C);
