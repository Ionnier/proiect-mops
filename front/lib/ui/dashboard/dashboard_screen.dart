import 'package:flutter/material.dart';
import 'package:front/data/settings.dart';
import 'package:front/ui/book_list_view/book_list_view.dart';
import 'package:front/ui/core/margin.dart';
import 'package:front/ui/desk_screen/desk_screen.dart';
import 'package:front/ui/rental_history/rental_history_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget createCard(BuildContext context, String title, String description,
      IconData data, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Icon(
              data,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Spacer(),
            Column(children: [Text(title), Text(description)]),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Settings().setApiKey(null);
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.settings))
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: ListView(children: [
            const SizedBox(
              height: 16,
            ),
            createCard(context, "Books", "Browse available books", Icons.book,
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookListView()));
            }),
            const Margin(),
            createCard(context, "Rental History", "See rental history",
                Icons.calendar_month, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RentalHistoryScreen()));
            }),
            const Margin(),
            createCard(context, "Desks", "See desks", Icons.calendar_view_day,
                () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeskScreen()));
            }),
          ]),
        ));
  }
}
