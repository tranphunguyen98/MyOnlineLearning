import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_lesson.g.dart';

@JsonSerializable(nullable: false)
class NetworkLesson {
  final String id;
  final String courseId;
  final String sectionId;
  final int numberOrder;
  final String name;
  final String videoUrl;
  final double hours;

  const NetworkLesson({
    this.id,
    this.courseId,
    this.sectionId,
    this.numberOrder,
    this.name,
    this.videoUrl,
    this.hours,
  });

  factory NetworkLesson.fromJson(Map<String, dynamic> json) =>
      _$NetworkLessonFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkLessonToJson(this);
}
