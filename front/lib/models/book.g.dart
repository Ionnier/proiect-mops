// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      bookId: json['bookId'] as int,
      name: json['name'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      category: json['category'] as String,
      releaseDateMillis: json['releaseDateMillis'] as int,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'name': instance.name,
      'author': instance.author,
      'category': instance.category,
      'releaseDateMillis': instance.releaseDateMillis,
    };
