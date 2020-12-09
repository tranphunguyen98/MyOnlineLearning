// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorResponse _$AuthorResponseFromJson(Map<String, dynamic> json) {
  return AuthorResponse(
    payload: NetworkAuthor.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorResponseToJson(AuthorResponse instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };
