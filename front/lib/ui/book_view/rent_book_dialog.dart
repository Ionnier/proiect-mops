import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:front/data/books_repository.dart';
import 'package:provider/provider.dart';

AlertDialog rentBookDialog(BuildContext context, int bookId) {
  return AlertDialog(
      scrollable: true,
      title: const Text("Rent book"),
      content: Consumer<BooksRepository>(builder: (context, repository, child) {
        return BookDialogContent(
          booksRepository: repository,
          bookId: bookId,
        );
      }));
}

class BookDialogContent extends StatefulWidget {
  final BooksRepository booksRepository;
  final int bookId;
  const BookDialogContent(
      {super.key, required this.booksRepository, required this.bookId});

  @override
  State<BookDialogContent> createState() => _BookDialogContentState();
}

class _BookDialogContentState extends State<BookDialogContent> {
  int? _selectedDuration;
  DateTime? _selectedDate;
  bool _isLoading = false;
  String? _error;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              DropdownButton(
                items: [3, 7, 14, 21].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
                value: _selectedDuration,
                hint: const Text("Duration (days)"),
                onChanged: (value) {
                  setState(() {
                    _selectedDuration = value;
                  });
                },
              ),
              DateTimeFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Date',
                ),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                mode: DateTimeFieldPickerMode.date,
                initialPickerDateTime:
                    DateTime.now().add(const Duration(days: 1)),
                onChanged: (DateTime? value) {
                  _selectedDate = value;
                },
              ),
              if (_error != null)
                Text(
                  _error!,
                  style: const TextStyle(color: Colors.red),
                ),
              TextButton(
                child: const Text('Rent'),
                onPressed: () async {
                  if (_selectedDate == null || _selectedDuration == null) {
                    return;
                  }
                  setState(() {
                    _isLoading = true;
                  });
                  final error = await widget.booksRepository.rentBook(
                      widget.bookId, _selectedDate!, _selectedDuration!);
                  if (error == null) {
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                    return;
                  }
                  setState(() {
                    _isLoading = false;
                    _error = error;
                  });
                },
              ),
            ],
          );
  }
}
