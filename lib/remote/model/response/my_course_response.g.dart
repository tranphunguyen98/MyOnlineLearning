// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseResponse _$MyCourseResponseFromJson(Map<String, dynamic> json) {
  return MyCourseResponse(
    message: json['message'] as String,
    payload: (json['payload'] as List)
        .map((e) => NetworkMyCourse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MyCourseResponseToJson(MyCourseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
