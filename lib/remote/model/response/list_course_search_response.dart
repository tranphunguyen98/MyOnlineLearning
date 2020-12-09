import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/search_course_result.dart';

part 'list_course_search_response.g.dart';

@JsonSerializable(nullable: false)
class ListCourseSearchResponse {
  final String message;
  final SearchCourseResult payload;

  ListCourseSearchResponse({this.message, this.payload});

  factory ListCourseSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCourseSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCourseSearchResponseToJson(this);
}
