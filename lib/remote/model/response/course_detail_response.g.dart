// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailResponse _$CourseDetailResponseFromJson(Map<String, dynamic> json) {
  return CourseDetailResponse(
    message: json['message'] as String,
    payload:
        NetworkCourseDetail.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CourseDetailResponseToJson(
        CourseDetailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
