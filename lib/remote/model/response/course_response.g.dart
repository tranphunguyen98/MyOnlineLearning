// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) {
  return CourseResponse(
    message: json['message'] as String,
    payload: NetworkCourse.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
