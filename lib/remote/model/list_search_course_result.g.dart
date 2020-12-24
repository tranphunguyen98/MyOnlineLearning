// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search_course_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSearchCourseResult _$ListSearchCourseResultFromJson(
    Map<String, dynamic> json) {
  return ListSearchCourseResult(
    courses:
        SearchCourseResult.fromJson(json['courses'] as Map<String, dynamic>),
    instructors: SearchAuthorResult.fromJson(
        json['instructors'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListSearchCourseResultToJson(
        ListSearchCourseResult instance) =>
    <String, dynamic>{
      'courses': instance.courses,
      'instructors': instance.instructors,
    };
