import 'package:flutter/material.dart';
import 'package:google_books/src/blocs/application_bloc.dart';
import 'package:google_books/src/providers/bloc_provider.dart';
import 'package:google_books/src/ui/screens/home.dart';

void main() => runApp(
    BlocProvider<ApplicationBloc>(bloc: ApplicationBloc(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPrintRebuildDirtyWidgets = true;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.yellow,
      ),
      title: 'Google Books',
      home: Home(),
    );
  }
}
