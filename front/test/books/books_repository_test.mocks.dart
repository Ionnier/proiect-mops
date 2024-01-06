// Mocks generated by Mockito 5.4.3 from annotations
// in front/test/books/books_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dio/dio.dart' as _i2;
import 'package:front/data/settings.dart' as _i5;
import 'package:front/models/author.dart' as _i3;
import 'package:front/models/book.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

class _FakeAuthor_1 extends _i1.SmartFake implements _i3.Author {
  _FakeAuthor_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$BookCopyWith_2<$Res> extends _i1.SmartFake
    implements _i4.$BookCopyWith<$Res> {
  _Fake$BookCopyWith_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Settings].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettings extends _i1.Mock implements _i5.Settings {
  MockSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<void> initialise() => (super.noSuchMethod(
        Invocation.method(
          #initialise,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

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

/// A class which mocks [Book].
///
/// See the documentation for Mockito's code generation for more information.
class MockBook extends _i1.Mock implements _i4.Book {
  @override
  int get bookId => (super.noSuchMethod(
        Invocation.getter(#bookId),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);

  @override
  _i3.Author get author => (super.noSuchMethod(
        Invocation.getter(#author),
        returnValue: _FakeAuthor_1(
          this,
          Invocation.getter(#author),
        ),
        returnValueForMissingStub: _FakeAuthor_1(
          this,
          Invocation.getter(#author),
        ),
      ) as _i3.Author);

  @override
  String get category => (super.noSuchMethod(
        Invocation.getter(#category),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#category),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#category),
        ),
      ) as String);

  @override
  int get releaseDateMillis => (super.noSuchMethod(
        Invocation.getter(#releaseDateMillis),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  _i4.$BookCopyWith<_i4.Book> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$BookCopyWith_2<_i4.Book>(
          this,
          Invocation.getter(#copyWith),
        ),
        returnValueForMissingStub: _Fake$BookCopyWith_2<_i4.Book>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i4.$BookCopyWith<_i4.Book>);

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}
