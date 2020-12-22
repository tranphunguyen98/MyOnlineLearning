// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoryResponse _$ListCategoryResponseFromJson(Map<String, dynamic> json) {
  return ListCategoryResponse(
    payload: (json['payload'] as List)
        .map((e) => NetworkCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListCategoryResponseToJson(
        ListCategoryResponse instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };
