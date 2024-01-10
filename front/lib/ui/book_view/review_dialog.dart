import 'package:flutter/material.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/ui/core/margin.dart';

AlertDialog showReviewDailog(
    BuildContext context, int bookId, BooksRepository booksRepository) {
  return AlertDialog(
      scrollable: true,
      content: ReviewDialogContent(
          bookId: bookId, booksRepository: booksRepository));
}

class ReviewDialogContent extends StatefulWidget {
  final int bookId;
  final BooksRepository booksRepository;
  const ReviewDialogContent(
      {super.key, required this.bookId, required this.booksRepository});

  @override
  State<ReviewDialogContent> createState() => _ReviewDialogContentState();
}

class _ReviewDialogContentState extends State<ReviewDialogContent> {
  final contentController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text("Content")),
                controller: contentController,
              ),
              const Margin(
                heightMultiplyer: 3,
              ),
              TextButton(
                  onPressed: () async {
                    if (contentController.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });
                    final errorMessage = await widget.booksRepository
                        .writeReview(widget.bookId, contentController.text);
                    setState(() {
                      isLoading = false;
                    });
                    if (errorMessage == null) {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                      return;
                    }
                  },
                  child: const Text("Submit"))
            ],
          );
  }
}
