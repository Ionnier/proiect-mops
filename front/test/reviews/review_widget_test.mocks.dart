// Mocks generated by Mockito 5.4.4 from annotations
// in front/test/reviews/review_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:front/data/books_repository.dart' as _i3;
import 'package:front/data/settings.dart' as _i6;
import 'package:front/models/book.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksRepository extends _i1.Mock implements _i3.BooksRepository {
  MockBooksRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.Book>?> getBooks() => (super.noSuchMethod(
        Invocation.method(
          #getBooks,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Book>?>.value(),
      ) as _i4.Future<List<_i5.Book>?>);

  @override
  _i4.Future<String?> rentBook(
    int? bookId,
    DateTime? startDate,
    int? duration,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #rentBook,
          [
            bookId,
            startDate,
            duration,
          ],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);

  @override
  _i4.Future<String?> writeReview(
    int? bookId,
    String? content,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeReview,
          [
            bookId,
            content,
          ],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
}

/// A class which mocks [Settings].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettings extends _i1.Mock implements _i6.Settings {
  MockSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> initialise() => (super.noSuchMethod(
        Invocation.method(
          #initialise,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void setFavorites(List<String>? value) => super.noSuchMethod(
        Invocation.method(
          #setFavorites,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.Dio provideDio() => (super.noSuchMethod(
        Invocation.method(
          #provideDio,
          [],
        ),
        returnValue: _FakeDio_0(
          this,
          Invocation.method(
            #provideDio,
            [],
          ),
        ),
      ) as _i2.Dio);

  @override
  void setApiKey(String? value) => super.noSuchMethod(
        Invocation.method(
          #setApiKey,
          [value],
        ),
        returnValueForMissingStub: null,
      );
}
