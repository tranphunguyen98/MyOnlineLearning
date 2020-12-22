import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';
import 'package:my_online_learning/remote/model/network_course_detail.dart';

part 'course_detail_response.g.dart';

@JsonSerializable(nullable: false)
class CourseDetailResponse {
  final String message;
  final NetworkCourseDetail payload;

  CourseDetailResponse({this.message, this.payload});

  factory CourseDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailResponseToJson(this);
}
