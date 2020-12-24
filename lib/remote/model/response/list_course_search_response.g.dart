// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_course_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCourseSearchResponse _$ListCourseSearchResponseFromJson(
    Map<String, dynamic> json) {
  return ListCourseSearchResponse(
    message: json['message'] as String,
    payload: ListSearchCourseResult.fromJson(
        json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListCourseSearchResponseToJson(
        ListCourseSearchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
