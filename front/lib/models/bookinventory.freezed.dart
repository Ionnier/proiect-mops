// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookinventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookInventory _$BookInventoryFromJson(Map<String, dynamic> json) {
  return _BookInventory.fromJson(json);
}

/// @nodoc
mixin _$BookInventory {
  int get inventoryId => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  Book get book => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookInventoryCopyWith<BookInventory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookInventoryCopyWith<$Res> {
  factory $BookInventoryCopyWith(
          BookInventory value, $Res Function(BookInventory) then) =
      _$BookInventoryCopyWithImpl<$Res, BookInventory>;
  @useResult
  $Res call({int inventoryId, String state, Book book});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$BookInventoryCopyWithImpl<$Res, $Val extends BookInventory>
    implements $BookInventoryCopyWith<$Res> {
  _$BookInventoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventoryId = null,
    Object? state = null,
    Object? book = null,
  }) {
    return _then(_value.copyWith(
      inventoryId: null == inventoryId
          ? _value.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookInventoryImplCopyWith<$Res>
    implements $BookInventoryCopyWith<$Res> {
  factory _$$BookInventoryImplCopyWith(
          _$BookInventoryImpl value, $Res Function(_$BookInventoryImpl) then) =
      __$$BookInventoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int inventoryId, String state, Book book});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$BookInventoryImplCopyWithImpl<$Res>
    extends _$BookInventoryCopyWithImpl<$Res, _$BookInventoryImpl>
    implements _$$BookInventoryImplCopyWith<$Res> {
  __$$BookInventoryImplCopyWithImpl(
      _$BookInventoryImpl _value, $Res Function(_$BookInventoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventoryId = null,
    Object? state = null,
    Object? book = null,
  }) {
    return _then(_$BookInventoryImpl(
      inventoryId: null == inventoryId
          ? _value.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookInventoryImpl implements _BookInventory {
  const _$BookInventoryImpl(
      {required this.inventoryId, required this.state, required this.book});

  factory _$BookInventoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookInventoryImplFromJson(json);

  @override
  final int inventoryId;
  @override
  final String state;
  @override
  final Book book;

  @override
  String toString() {
    return 'BookInventory(inventoryId: $inventoryId, state: $state, book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookInventoryImpl &&
            (identical(other.inventoryId, inventoryId) ||
                other.inventoryId == inventoryId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.book, book) || other.book == book));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inventoryId, state, book);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookInventoryImplCopyWith<_$BookInventoryImpl> get copyWith =>
      __$$BookInventoryImplCopyWithImpl<_$BookInventoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookInventoryImplToJson(
      this,
    );
  }
}

abstract class _BookInventory implements BookInventory {
  const factory _BookInventory(
      {required final int inventoryId,
      required final String state,
      required final Book book}) = _$BookInventoryImpl;

  factory _BookInventory.fromJson(Map<String, dynamic> json) =
      _$BookInventoryImpl.fromJson;

  @override
  int get inventoryId;
  @override
  String get state;
  @override
  Book get book;
  @override
  @JsonKey(ignore: true)
  _$$BookInventoryImplCopyWith<_$BookInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
