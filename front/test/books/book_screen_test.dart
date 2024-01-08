import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/ui/book_list_view/book_list_item.dart';
import 'package:front/ui/book_list_view/book_list_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import 'book_screen_test.mocks.dart';

@GenerateMocks([Settings])
void main() async {
  var mockedSettings = MockSettings();
  final (dio, dioAdapter) = testDio();
  when(mockedSettings.provideDio()).thenReturn(dio);
  final json = await getMappingData("books/getAll.json");
  dioAdapter.onGet("/books", (request) async {
    request.reply(200, json, headers: {
      "Content-Type": ["application/json"]
    });
  });
  var bookRepository = BooksRepository(mockedSettings);

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(Provider<BooksRepository>(
      create: (context) => bookRepository,
      child: const MaterialApp(
        home: BookListView(),
      ),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('Book list screen has search element',
      (WidgetTester tester) async {
    await pumpScreen(tester);
    expect(find.byType(TextField), findsOne);
    expect(find.byType(BookListItem), findsAtLeast(4));
  });

  testWidgets('Adding test filters items', (WidgetTester tester) async {
    await pumpScreen(tester);
    await tester.enterText(find.byType(TextField), "whatever");
    await tester.pumpAndSettle();
    expect(find.byType(BookListItem), findsNothing);
  });
}
