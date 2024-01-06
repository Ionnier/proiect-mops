import 'package:flutter/material.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/ui/book_list_view/book_list_item.dart';
import 'package:provider/provider.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
      ),
      body: Consumer<BooksRepository>(builder: (context, repository, child) {
        return FutureBuilder(
            future: repository.getBooks(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    snapshot.data;
                    return ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: (snapshot.data ?? List.empty()).map((book) {
                        return BookListItem(book: book);
                      }).toList(),
                    );
                  }
              }
            });
      }),
    );
  }
}
