// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_course_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCourseResult _$SearchCourseResultFromJson(Map<String, dynamic> json) {
  return SearchCourseResult(
    rows: (json['rows'] as List)
        .map((e) => NetworkCourse.fromJson(e as Map<String, dynamic>))
        .toList(),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$SearchCourseResultToJson(SearchCourseResult instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'count': instance.count,
    };
