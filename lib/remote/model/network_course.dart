import 'package:json_annotation/json_annotation.dart';

part 'network_course.g.dart';

@JsonSerializable(nullable: false)
class NetworkCourse {
  final String id;
  final String title;
  final String subtitle;
  final int price;
  final String description;
  final int ratedNumber;
  final int totalHours;
  final String imageUrl;
  final String createdAt;
  final String instructorId;
  //final String level;

  const NetworkCourse({
    this.id = "",
    this.title = "",
    this.subtitle = "",
    this.price = 0,
    this.ratedNumber = 0,
    this.totalHours = 0,
    this.imageUrl = "",
    this.createdAt = "",
    this.instructorId,
    this.description = "",
  });

  factory NetworkCourse.fromJson(Map<String, dynamic> json) =>
      _$NetworkCourseFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkCourseToJson(this);
}
