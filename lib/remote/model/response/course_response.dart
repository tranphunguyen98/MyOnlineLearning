import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

part 'course_response.g.dart';

@JsonSerializable(nullable: false)
class CourseResponse {
  final String message;
  final NetworkCourse payload;

  CourseResponse({this.message, this.payload});

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}
