import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_books/src/blocs/application_bloc.dart';
import 'package:google_books/src/providers/bloc_provider.dart';
import 'package:google_books/src/resources/repository.dart';

void main() => runApp(
    BlocProvider<ApplicationBloc>(bloc: ApplicationBloc(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPrintRebuildDirtyWidgets = true;
    return MaterialApp(
      title: 'Google Books',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.yellow),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final repository = Repository();

  void _incrementCounter() {
    repository.fetchAllBooks(search: 'Harry Potter').then((data) {
      print('DATA FINAL: ');
      print(json.encode(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'GOOGLE BOOKS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto-Bold',
                    fontSize: 26),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                style: TextStyle(color: Colors.white, decorationColor: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Which books do you want to search?'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      child: Text('Search'),
                      onPressed: () {},
                      padding: EdgeInsets.all(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
