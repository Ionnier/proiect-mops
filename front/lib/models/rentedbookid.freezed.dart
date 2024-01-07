// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rentedbookid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RentedBookId _$RentedBookIdFromJson(Map<String, dynamic> json) {
  return _RentedBookId.fromJson(json);
}

/// @nodoc
mixin _$RentedBookId {
  int get inventoryId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentedBookIdCopyWith<RentedBookId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentedBookIdCopyWith<$Res> {
  factory $RentedBookIdCopyWith(
          RentedBookId value, $Res Function(RentedBookId) then) =
      _$RentedBookIdCopyWithImpl<$Res, RentedBookId>;
  @useResult
  $Res call({int inventoryId, int userId, int createdAt});
}

/// @nodoc
class _$RentedBookIdCopyWithImpl<$Res, $Val extends RentedBookId>
    implements $RentedBookIdCopyWith<$Res> {
  _$RentedBookIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventoryId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      inventoryId: null == inventoryId
          ? _value.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentedBookIdImplCopyWith<$Res>
    implements $RentedBookIdCopyWith<$Res> {
  factory _$$RentedBookIdImplCopyWith(
          _$RentedBookIdImpl value, $Res Function(_$RentedBookIdImpl) then) =
      __$$RentedBookIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int inventoryId, int userId, int createdAt});
}

/// @nodoc
class __$$RentedBookIdImplCopyWithImpl<$Res>
    extends _$RentedBookIdCopyWithImpl<$Res, _$RentedBookIdImpl>
    implements _$$RentedBookIdImplCopyWith<$Res> {
  __$$RentedBookIdImplCopyWithImpl(
      _$RentedBookIdImpl _value, $Res Function(_$RentedBookIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventoryId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$RentedBookIdImpl(
      inventoryId: null == inventoryId
          ? _value.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentedBookIdImpl implements _RentedBookId {
  const _$RentedBookIdImpl(
      {required this.inventoryId,
      required this.userId,
      required this.createdAt});

  factory _$RentedBookIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentedBookIdImplFromJson(json);

  @override
  final int inventoryId;
  @override
  final int userId;
  @override
  final int createdAt;

  @override
  String toString() {
    return 'RentedBookId(inventoryId: $inventoryId, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentedBookIdImpl &&
            (identical(other.inventoryId, inventoryId) ||
                other.inventoryId == inventoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inventoryId, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentedBookIdImplCopyWith<_$RentedBookIdImpl> get copyWith =>
      __$$RentedBookIdImplCopyWithImpl<_$RentedBookIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentedBookIdImplToJson(
      this,
    );
  }
}

abstract class _RentedBookId implements RentedBookId {
  const factory _RentedBookId(
      {required final int inventoryId,
      required final int userId,
      required final int createdAt}) = _$RentedBookIdImpl;

  factory _RentedBookId.fromJson(Map<String, dynamic> json) =
      _$RentedBookIdImpl.fromJson;

  @override
  int get inventoryId;
  @override
  int get userId;
  @override
  int get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$RentedBookIdImplCopyWith<_$RentedBookIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
