import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';
import 'package:my_online_learning/remote/model/network_user.dart';

part 'list_course_response.g.dart';

@JsonSerializable(nullable: false)
class ListCourseResponse {
  final String message;
  final List<NetworkCourse> payload;

  ListCourseResponse({this.message, this.payload});

  factory ListCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCourseResponseToJson(this);
}
