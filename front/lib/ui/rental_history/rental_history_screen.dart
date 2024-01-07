import 'package:flutter/material.dart';
import 'package:front/data/rental_repository.dart';
import 'package:front/ui/rental_history/rental_history_item.dart';
import 'package:provider/provider.dart';

class RentalHistoryScreen extends StatelessWidget {
  const RentalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rental History"),
      ),
      body: Consumer<RentalRepository>(
        builder: (context, repository, child) => FutureBuilder(
            future: repository.getRentedBooks(),
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
                        return RentalHistoryItem(
                          rentedBook: book,
                        );
                      }).toList(),
                    );
                  }
              }
            }),
      ),
    );
  }
}
