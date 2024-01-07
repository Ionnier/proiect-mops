// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentedbookid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentedBookIdImpl _$$RentedBookIdImplFromJson(Map<String, dynamic> json) =>
    _$RentedBookIdImpl(
      inventoryId: json['inventoryId'] as int,
      userId: json['userId'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$RentedBookIdImplToJson(_$RentedBookIdImpl instance) =>
    <String, dynamic>{
      'inventoryId': instance.inventoryId,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
    };
