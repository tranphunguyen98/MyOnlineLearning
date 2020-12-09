// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCourseResponse _$ListCourseResponseFromJson(Map<String, dynamic> json) {
  return ListCourseResponse(
    message: json['message'] as String,
    payload: (json['payload'] as List)
        .map((e) => NetworkCourse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListCourseResponseToJson(ListCourseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
