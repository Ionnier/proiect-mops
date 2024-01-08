import 'package:flutter/material.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/book.dart';
import 'package:front/ui/book_view/book_view.dart';
import 'package:provider/provider.dart';

class BookListItem extends StatefulWidget {
  final Book book;

  const BookListItem({super.key, required this.book});

  @override
  State<BookListItem> createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      Future.delayed(Duration.zero, () {
        for (var element in (settings.getFavoritedIds() ?? [])) {
          if (element == widget.book.bookId.toString()) {
            setState(() {
              isSelected = true;
            });
            break;
          }
        }
      });
      void asd() {
        final initialList = settings.getFavoritedIds() ?? [];
        if (initialList.contains(widget.book.bookId.toString())) {
          initialList.remove(widget.book.bookId.toString());
        } else {
          initialList.add(widget.book.bookId.toString());
        }
        settings.setFavorites(initialList);
        setState(() {
          isSelected = initialList.contains(widget.book.bookId.toString());
        });
        return;
      }
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.book.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            isSelected
                ? IconButton(onPressed: asd, icon: const Icon(Icons.favorite))
                : IconButton(
                    onPressed: asd, icon: const Icon(Icons.favorite_outline))
          ],
        ),
        subtitle: Text(
          widget.book.author.name,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookView(book: widget.book),
            ),
          ),
        },
      );
    });
  }
}
