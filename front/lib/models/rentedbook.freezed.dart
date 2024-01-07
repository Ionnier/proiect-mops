// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rentedbook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RentedBook _$RentedBookFromJson(Map<String, dynamic> json) {
  return _RentedBook.fromJson(json);
}

/// @nodoc
mixin _$RentedBook {
  RentedBookId get id => throw _privateConstructorUsedError;
  BookInventory get bookInventory => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  int get dueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentedBookCopyWith<RentedBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentedBookCopyWith<$Res> {
  factory $RentedBookCopyWith(
          RentedBook value, $Res Function(RentedBook) then) =
      _$RentedBookCopyWithImpl<$Res, RentedBook>;
  @useResult
  $Res call(
      {RentedBookId id,
      BookInventory bookInventory,
      String state,
      int dueDate});

  $RentedBookIdCopyWith<$Res> get id;
  $BookInventoryCopyWith<$Res> get bookInventory;
}

/// @nodoc
class _$RentedBookCopyWithImpl<$Res, $Val extends RentedBook>
    implements $RentedBookCopyWith<$Res> {
  _$RentedBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookInventory = null,
    Object? state = null,
    Object? dueDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as RentedBookId,
      bookInventory: null == bookInventory
          ? _value.bookInventory
          : bookInventory // ignore: cast_nullable_to_non_nullable
              as BookInventory,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RentedBookIdCopyWith<$Res> get id {
    return $RentedBookIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BookInventoryCopyWith<$Res> get bookInventory {
    return $BookInventoryCopyWith<$Res>(_value.bookInventory, (value) {
      return _then(_value.copyWith(bookInventory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentedBookImplCopyWith<$Res>
    implements $RentedBookCopyWith<$Res> {
  factory _$$RentedBookImplCopyWith(
          _$RentedBookImpl value, $Res Function(_$RentedBookImpl) then) =
      __$$RentedBookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RentedBookId id,
      BookInventory bookInventory,
      String state,
      int dueDate});

  @override
  $RentedBookIdCopyWith<$Res> get id;
  @override
  $BookInventoryCopyWith<$Res> get bookInventory;
}

/// @nodoc
class __$$RentedBookImplCopyWithImpl<$Res>
    extends _$RentedBookCopyWithImpl<$Res, _$RentedBookImpl>
    implements _$$RentedBookImplCopyWith<$Res> {
  __$$RentedBookImplCopyWithImpl(
      _$RentedBookImpl _value, $Res Function(_$RentedBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookInventory = null,
    Object? state = null,
    Object? dueDate = null,
  }) {
    return _then(_$RentedBookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as RentedBookId,
      bookInventory: null == bookInventory
          ? _value.bookInventory
          : bookInventory // ignore: cast_nullable_to_non_nullable
              as BookInventory,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentedBookImpl implements _RentedBook {
  const _$RentedBookImpl(
      {required this.id,
      required this.bookInventory,
      required this.state,
      required this.dueDate});

  factory _$RentedBookImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentedBookImplFromJson(json);

  @override
  final RentedBookId id;
  @override
  final BookInventory bookInventory;
  @override
  final String state;
  @override
  final int dueDate;

  @override
  String toString() {
    return 'RentedBook(id: $id, bookInventory: $bookInventory, state: $state, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentedBookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookInventory, bookInventory) ||
                other.bookInventory == bookInventory) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bookInventory, state, dueDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentedBookImplCopyWith<_$RentedBookImpl> get copyWith =>
      __$$RentedBookImplCopyWithImpl<_$RentedBookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentedBookImplToJson(
      this,
    );
  }
}

abstract class _RentedBook implements RentedBook {
  const factory _RentedBook(
      {required final RentedBookId id,
      required final BookInventory bookInventory,
      required final String state,
      required final int dueDate}) = _$RentedBookImpl;

  factory _RentedBook.fromJson(Map<String, dynamic> json) =
      _$RentedBookImpl.fromJson;

  @override
  RentedBookId get id;
  @override
  BookInventory get bookInventory;
  @override
  String get state;
  @override
  int get dueDate;
  @override
  @JsonKey(ignore: true)
  _$$RentedBookImplCopyWith<_$RentedBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
