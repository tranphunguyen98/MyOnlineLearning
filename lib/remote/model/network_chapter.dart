import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_online_learning/remote/model/network_lesson.dart';

part 'network_chapter.g.dart';

@JsonSerializable(nullable: false)
class NetworkChapter {
  final String id;
  final String courseId;
  final String name;
  final double sumHours;
  final int numberOrder;
  final bool isStudying;
  final List<NetworkLesson> lesson;

  const NetworkChapter(
      {this.name,
      this.sumHours,
      this.numberOrder,
      this.lesson,
      this.id,
      this.courseId,
      this.isStudying = false});

  factory NetworkChapter.fromJson(Map<String, dynamic> json) =>
      _$NetworkChapterFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkChapterToJson(this);
}
