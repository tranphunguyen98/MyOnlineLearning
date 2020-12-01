// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkAuthor _$NetworkAuthorFromJson(Map<String, dynamic> json) {
  return NetworkAuthor(
    id: json['id'] as String,
    name: json['name'] as String,
    avatar: json['avatar'] as String,
    courses: (json['courses'] as List)
        .map((e) => NetworkCourse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NetworkAuthorToJson(NetworkAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'courses': instance.courses,
    };
