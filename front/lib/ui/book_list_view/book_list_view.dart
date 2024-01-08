import 'package:flutter/material.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/models/book.dart';
import 'package:front/ui/book_list_view/book_list_item.dart';
import 'package:provider/provider.dart';

class BookListContent extends StatefulWidget {
  final List<Book>? data;
  const BookListContent({super.key, this.data});

  @override
  State<BookListContent> createState() => _BookListContentState();
}

class _BookListContentState extends State<BookListContent> {
  String currentString = "";
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      ListTile(
        leading: const Icon(Icons.search),
        title: TextField(
          controller: textController,
          decoration: const InputDecoration(
              hintText: 'Search', border: InputBorder.none),
          onChanged: (value) {
            setState(() {
              currentString = value;
            });
          },
        ),
        trailing: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            textController.clear();
            setState(() {
              currentString = "";
            });
          },
        ),
      )
    ];
    for (var book in widget.data ?? List.empty()) {
      if (currentString.isNotEmpty &&
          !(book as Book)
              .name
              .trim()
              .toLowerCase()
              .contains(currentString.toLowerCase())) {
        continue;
      }
      children.add(BookListItem(book: book));
    }
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: children,
    );
  }
}

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
                    return BookListContent(
                      data: snapshot.data,
                    );
                  }
              }
            });
      }),
    );
  }
}
