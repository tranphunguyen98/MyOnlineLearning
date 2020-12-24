// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_author_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAuthorResponse _$ItemAuthorResponseFromJson(Map<String, dynamic> json) {
  return ItemAuthorResponse(
    name: json['name'] as String,
    avatar: json['avatar'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ItemAuthorResponseToJson(ItemAuthorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };
