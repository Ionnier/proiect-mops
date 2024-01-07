// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookinventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookInventoryImpl _$$BookInventoryImplFromJson(Map<String, dynamic> json) =>
    _$BookInventoryImpl(
      inventoryId: json['inventoryId'] as int,
      state: json['state'] as String,
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookInventoryImplToJson(_$BookInventoryImpl instance) =>
    <String, dynamic>{
      'inventoryId': instance.inventoryId,
      'state': instance.state,
      'book': instance.book,
    };
