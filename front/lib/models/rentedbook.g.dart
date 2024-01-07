// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentedbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentedBookImpl _$$RentedBookImplFromJson(Map<String, dynamic> json) =>
    _$RentedBookImpl(
      id: RentedBookId.fromJson(json['id'] as Map<String, dynamic>),
      bookInventory:
          BookInventory.fromJson(json['bookInventory'] as Map<String, dynamic>),
      state: json['state'] as String,
      dueDate: json['dueDate'] as int,
    );

Map<String, dynamic> _$$RentedBookImplToJson(_$RentedBookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookInventory': instance.bookInventory,
      'state': instance.state,
      'dueDate': instance.dueDate,
    };
