import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

part 'search_course_result.g.dart';

@JsonSerializable(nullable: false)
class SearchCourseResult {
  final List<NetworkCourse> data;

  SearchCourseResult({this.data});

  factory SearchCourseResult.fromJson(Map<String, dynamic> json) =>
      _$SearchCourseResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCourseResultToJson(this);
}
