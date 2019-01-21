import 'package:flutter/material.dart';
import 'package:google_books/src/blocs/application_bloc.dart';
import 'package:google_books/src/providers/bloc_provider.dart';
import 'package:google_books/src/ui/screens/books_list/books_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationBloc>(context);
    return SafeArea(
      child: Scaffold(
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
                TextField(
                  onChanged: bloc.changeSearch,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  style: TextStyle(
                      color: Colors.black, decorationColor: Colors.white),
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
                        child: StreamBuilder(
                      stream: bloc.searchValue,
                      initialData: '',
                      builder: (context, snapshot) {
                        final activeButton =
                            snapshot.data.toString().length > 0;
                        return OutlineButton(
                          child: Text('Search'),
                          onPressed: activeButton
                              ? () => _openListPage(context, bloc)
                              : null,
                          padding: EdgeInsets.all(15),
                        );
                      },
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _openListPage(BuildContext context, ApplicationBloc bloc) {
    bloc.fetchAllBooks();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BooksList()));
  }
}
