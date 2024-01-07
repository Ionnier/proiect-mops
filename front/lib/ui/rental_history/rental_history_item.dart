import 'package:flutter/material.dart';
import 'package:front/models/rentedbook.dart';

class RentalHistoryItem extends StatelessWidget {
  final RentedBook rentedBook;

  const RentalHistoryItem({super.key, required this.rentedBook});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${rentedBook.bookInventory.book.name} - ${rentedBook.bookInventory.book.author.name}",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${DateTime.fromMillisecondsSinceEpoch(rentedBook.id.createdAt).toIso8601String().split("T")[0]} - ${DateTime.fromMillisecondsSinceEpoch(rentedBook.dueDate).toIso8601String().split("T")[0]}",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            rentedBook.state,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
      tileColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
