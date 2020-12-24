import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/search_author_result.dart';
import 'package:my_online_learning/remote/model/search_course_result.dart';

part 'list_search_course_result.g.dart';

@JsonSerializable(nullable: false)
class ListSearchCourseResult {
  final SearchCourseResult courses;
  final SearchAuthorResult instructors;

  ListSearchCourseResult({this.courses, this.instructors});

  factory ListSearchCourseResult.fromJson(Map<String, dynamic> json) =>
      _$ListSearchCourseResultFromJson(json);

  Map<String, dynamic> toJson() => _$ListSearchCourseResultToJson(this);
}
