import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';
import 'package:my_online_learning/remote/model/network_my_course.dart';

part 'my_course_response.g.dart';

@JsonSerializable(nullable: false)
class MyCourseResponse {
  final String message;
  final List<NetworkMyCourse> payload;

  MyCourseResponse({this.message, this.payload});

  factory MyCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$MyCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyCourseResponseToJson(this);
}
