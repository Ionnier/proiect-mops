import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/author.dart';
import 'package:front/models/book.dart';
import 'package:front/ui/book_view/book_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'review_widget_test.mocks.dart';

@GenerateMocks([BooksRepository, Settings])
void main() {
  var book = Book(
      bookId: 1,
      name: "Name",
      author: const Author(authorId: 1, name: "authorName"),
      category: "Category",
      releaseDateMillis: DateTime.now().millisecondsSinceEpoch);
  var mockedSettings = MockSettings();
  final (dio, dioAdapter) = testDio();
  when(mockedSettings.provideDio()).thenReturn(dio);
  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(Provider<BooksRepository>(
      create: (context) => BooksRepository(mockedSettings),
      child: MaterialApp(
        home: BookView(book: book),
      ),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('BookView has review text', (WidgetTester tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();
    expect(find.text("Review"), findsOne);
  });

  Future<void> showAlertDialog(WidgetTester tester) async {
    await pumpScreen(tester);
    await tester.tap(find.text("Review"));
    await tester.pumpAndSettle();

    expect(find.byWidgetPredicate((e) => e is AlertDialog), findsOne);
  }

  testWidgets('review text opens an AlertDialog on tap',
      (WidgetTester tester) async {
    await showAlertDialog(tester);
  });

  testWidgets(
      'review AlertDialog has one textformfield, one text named contend as input decoration and one text button name submit',
      (WidgetTester tester) async {
    await showAlertDialog(tester);
    expect(
        find.byWidgetPredicate((widget) => widget is TextFormField), findsOne);
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate((widget) => widget is InputDecorator), findsOne);
    expect(find.text("Content"), findsOne);

    expect(find.byWidgetPredicate((widget) {
      if (widget is TextButton) {
        return (widget).child is Text &&
            ((widget).child as Text).data == "Submit";
      }
      return false;
    }), findsOne);
  });

  testWidgets('tapping Submit button while empty does nothing',
      (WidgetTester tester) async {
    await showAlertDialog(tester);
    await tester.tap(find.text("Submit"));
    await tester.pumpAndSettle();
    expect(find.byWidgetPredicate((e) => e is AlertDialog), findsOne);
  });

  testWidgets(
      'tapping Submit with valid data will close alert dialog after some time',
      (WidgetTester tester) async {
    await showAlertDialog(tester);
    dioAdapter.onPost("/books/reviews", (server) {
      server.reply(201, "");
    });
    await tester.enterText(find.byType(TextFormField), "whatever");
    await tester.tap(find.text("Submit"));
    await tester.pumpAndSettle();
    expect(find.byWidgetPredicate((e) => e is AlertDialog), findsNothing);
  });
}
