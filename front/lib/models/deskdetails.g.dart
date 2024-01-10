// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deskdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeskDetailsImpl _$$DeskDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DeskDetailsImpl(
      desk: Desk.fromJson(json['desk'] as Map<String, dynamic>),
      reservedIntervals: (json['reservedIntervals'] as List<dynamic>)
          .map((e) => Interval.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DeskDetailsImplToJson(_$DeskDetailsImpl instance) =>
    <String, dynamic>{
      'desk': instance.desk,
      'reservedIntervals': instance.reservedIntervals,
    };
