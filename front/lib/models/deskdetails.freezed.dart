// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deskdetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeskDetails _$DeskDetailsFromJson(Map<String, dynamic> json) {
  return _DeskDetails.fromJson(json);
}

/// @nodoc
mixin _$DeskDetails {
  Desk get desk => throw _privateConstructorUsedError;
  List<Interval> get reservedIntervals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeskDetailsCopyWith<DeskDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeskDetailsCopyWith<$Res> {
  factory $DeskDetailsCopyWith(
          DeskDetails value, $Res Function(DeskDetails) then) =
      _$DeskDetailsCopyWithImpl<$Res, DeskDetails>;
  @useResult
  $Res call({Desk desk, List<Interval> reservedIntervals});

  $DeskCopyWith<$Res> get desk;
}

/// @nodoc
class _$DeskDetailsCopyWithImpl<$Res, $Val extends DeskDetails>
    implements $DeskDetailsCopyWith<$Res> {
  _$DeskDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desk = null,
    Object? reservedIntervals = null,
  }) {
    return _then(_value.copyWith(
      desk: null == desk
          ? _value.desk
          : desk // ignore: cast_nullable_to_non_nullable
              as Desk,
      reservedIntervals: null == reservedIntervals
          ? _value.reservedIntervals
          : reservedIntervals // ignore: cast_nullable_to_non_nullable
              as List<Interval>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeskCopyWith<$Res> get desk {
    return $DeskCopyWith<$Res>(_value.desk, (value) {
      return _then(_value.copyWith(desk: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeskDetailsImplCopyWith<$Res>
    implements $DeskDetailsCopyWith<$Res> {
  factory _$$DeskDetailsImplCopyWith(
          _$DeskDetailsImpl value, $Res Function(_$DeskDetailsImpl) then) =
      __$$DeskDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Desk desk, List<Interval> reservedIntervals});

  @override
  $DeskCopyWith<$Res> get desk;
}

/// @nodoc
class __$$DeskDetailsImplCopyWithImpl<$Res>
    extends _$DeskDetailsCopyWithImpl<$Res, _$DeskDetailsImpl>
    implements _$$DeskDetailsImplCopyWith<$Res> {
  __$$DeskDetailsImplCopyWithImpl(
      _$DeskDetailsImpl _value, $Res Function(_$DeskDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desk = null,
    Object? reservedIntervals = null,
  }) {
    return _then(_$DeskDetailsImpl(
      desk: null == desk
          ? _value.desk
          : desk // ignore: cast_nullable_to_non_nullable
              as Desk,
      reservedIntervals: null == reservedIntervals
          ? _value._reservedIntervals
          : reservedIntervals // ignore: cast_nullable_to_non_nullable
              as List<Interval>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeskDetailsImpl implements _DeskDetails {
  const _$DeskDetailsImpl(
      {required this.desk, required final List<Interval> reservedIntervals})
      : _reservedIntervals = reservedIntervals;

  factory _$DeskDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeskDetailsImplFromJson(json);

  @override
  final Desk desk;
  final List<Interval> _reservedIntervals;
  @override
  List<Interval> get reservedIntervals {
    if (_reservedIntervals is EqualUnmodifiableListView)
      return _reservedIntervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservedIntervals);
  }

  @override
  String toString() {
    return 'DeskDetails(desk: $desk, reservedIntervals: $reservedIntervals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeskDetailsImpl &&
            (identical(other.desk, desk) || other.desk == desk) &&
            const DeepCollectionEquality()
                .equals(other._reservedIntervals, _reservedIntervals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, desk,
      const DeepCollectionEquality().hash(_reservedIntervals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeskDetailsImplCopyWith<_$DeskDetailsImpl> get copyWith =>
      __$$DeskDetailsImplCopyWithImpl<_$DeskDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeskDetailsImplToJson(
      this,
    );
  }
}

abstract class _DeskDetails implements DeskDetails {
  const factory _DeskDetails(
      {required final Desk desk,
      required final List<Interval> reservedIntervals}) = _$DeskDetailsImpl;

  factory _DeskDetails.fromJson(Map<String, dynamic> json) =
      _$DeskDetailsImpl.fromJson;

  @override
  Desk get desk;
  @override
  List<Interval> get reservedIntervals;
  @override
  @JsonKey(ignore: true)
  _$$DeskDetailsImplCopyWith<_$DeskDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
