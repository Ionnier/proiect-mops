import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/books_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/models/book.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils.dart';
import 'books_repository_test.mocks.dart';

// after you annotate use #dart run build_runner build# to generate the mocks
@GenerateMocks([Settings])
@GenerateNiceMocks([MockSpec<Book>()])
void main() async {
  var (dio, dioAdapter) = testDio();
  group('bookRepository', () {
    test('test 200 response', () async {
      MockSettings settings = MockSettings();
      when(settings.provideDio()).thenReturn(dio);
      final json = await getMappingData("books/getAll.json");
      dioAdapter.onGet("/books", (request) async {
        request.reply(200, json, headers: {
          "Content-Type": ["application/json"]
        });
      });
      final repo = BooksRepository(settings);
      var books = await repo.getBooks();
      assert(books?.isNotEmpty == true);
    });
    test('test 400 response', () async {
      MockSettings settings = MockSettings();
      when(settings.provideDio()).thenReturn(dio);
      dioAdapter.onGet("/books", (request) async {
        request.reply(
          400,
          null,
        );
      });
      final repo = BooksRepository(settings);
      var books = await repo.getBooks();
      assert(books == null);
    });

    test('test 200 empty response', () async {
      MockSettings settings = MockSettings();
      when(settings.provideDio()).thenReturn(dio);
      final json = await getMappingData("emptyResponse.json");
      dioAdapter.onGet("/books", (request) async {
        request.reply(200, json, headers: {
          "Content-Type": ["application/json"]
        });
      });
      final repo = BooksRepository(settings);
      var books = await repo.getBooks();
      assert(books!.isEmpty);
    });
  });
}
