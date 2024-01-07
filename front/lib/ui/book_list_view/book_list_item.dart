import 'package:flutter/material.dart';
import 'package:front/models/book.dart';
import 'package:front/ui/book_view/book_view.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        book.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        book.author.name,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookView(book: book),
          ),
        ),
      },
    );
  }
}
