// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  int get bookId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get releaseDateMillis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {int bookId,
      String name,
      Author author,
      String category,
      int releaseDateMillis});

  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? name = null,
    Object? author = null,
    Object? category = null,
    Object? releaseDateMillis = null,
  }) {
    return _then(_value.copyWith(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateMillis: null == releaseDateMillis
          ? _value.releaseDateMillis
          : releaseDateMillis // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res> get author {
    return $AuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookId,
      String name,
      Author author,
      String category,
      int releaseDateMillis});

  @override
  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? name = null,
    Object? author = null,
    Object? category = null,
    Object? releaseDateMillis = null,
  }) {
    return _then(_$BookImpl(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateMillis: null == releaseDateMillis
          ? _value.releaseDateMillis
          : releaseDateMillis // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl with DiagnosticableTreeMixin implements _Book {
  const _$BookImpl(
      {required this.bookId,
      required this.name,
      required this.author,
      required this.category,
      required this.releaseDateMillis});

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final int bookId;
  @override
  final String name;
  @override
  final Author author;
  @override
  final String category;
  @override
  final int releaseDateMillis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(bookId: $bookId, name: $name, author: $author, category: $category, releaseDateMillis: $releaseDateMillis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('bookId', bookId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('releaseDateMillis', releaseDateMillis));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.releaseDateMillis, releaseDateMillis) ||
                other.releaseDateMillis == releaseDateMillis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bookId, name, author, category, releaseDateMillis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final int bookId,
      required final String name,
      required final Author author,
      required final String category,
      required final int releaseDateMillis}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  int get bookId;
  @override
  String get name;
  @override
  Author get author;
  @override
  String get category;
  @override
  int get releaseDateMillis;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
