// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_author_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAuthorResponse _$ListAuthorResponseFromJson(Map<String, dynamic> json) {
  return ListAuthorResponse(
    message: json['message'] as String,
    payload: (json['payload'] as List)
        .map((e) => ItemAuthorResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListAuthorResponseToJson(ListAuthorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
