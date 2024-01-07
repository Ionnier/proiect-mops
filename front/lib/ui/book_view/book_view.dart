import 'package:flutter/material.dart';
import 'package:front/models/book.dart';
import 'package:front/ui/book_view/rent_book_dialog.dart';
import 'package:front/ui/core/margin.dart';

// ignore: must_be_immutable
class BookView extends StatelessWidget {
  final Book book;

  const BookView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(book.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(
              children: [
                const Spacer(),
                Text(DateTime.fromMillisecondsSinceEpoch(book.releaseDateMillis)
                    .toString()),
                const Spacer()
              ],
            ),
            const SizedBox(
              height: 192,
              width: double.infinity,
              child: Placeholder(),
            ),
            const Margin(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(book.author.name), Text(book.category)],
            ),
            const Margin(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) =>
                            rentBookDialog(context, book.bookId),
                      );
                    },
                    icon: const Icon(Icons.edit_calendar))
              ],
            ),
          ]),
        ));
  }
}
