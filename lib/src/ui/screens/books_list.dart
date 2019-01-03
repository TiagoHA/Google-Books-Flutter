import 'package:flutter/material.dart';
import 'package:google_books/src/blocs/application_bloc.dart';
import 'package:google_books/src/models/books_model.dart';
import 'package:google_books/src/providers/bloc_provider.dart';
import 'package:google_books/src/ui/screens/book_detail.dart';

class BooksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(
            'Books List',
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {},
            )
          ],
        ),
        body: StreamBuilder(
          stream: bloc.booksList,
          builder: (context, AsyncSnapshot<BooksModel> snapshot) {
            if (snapshot.hasData) {
              return _booksList(context, snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _booksList(BuildContext context, AsyncSnapshot<BooksModel> snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(2),
      itemCount: snapshot.data.items.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, int index) {
        final book = snapshot.data.items[index];
        return Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            child: GridTile(
              child: InkResponse(
                onTap: () => _openDetailPage(context, book),
                enableFeedback: true,
                child: Image.network(
                  book.volumeInfo.imageLinks.thumbnail,
                ),
              ),
              footer: Container(
                padding: EdgeInsets.all(2),
                color: Colors.black.withOpacity(0.6),
                child: Text(
                  book.volumeInfo.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _openDetailPage(context, Item book) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BookDetail(book: book)));
  }
}
