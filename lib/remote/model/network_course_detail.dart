import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_online_learning/remote/model/network_author.dart';
import 'package:my_online_learning/remote/model/network_chapter.dart';

part 'network_course_detail.g.dart';

@JsonSerializable(nullable: false)
class NetworkCourseDetail {
  final String id;
  final String title;
  final String subtitle;
  final int price;
  final String description;
  final int ratedNumber;
  final double totalHours;
  final String imageUrl;
  final String promoVidUrl;
  final String updatedAt;
  final String instructorId;
  final String instructorName;
  final List<NetworkChapter> section;
  final NetworkAuthor instructor;

  NetworkCourseDetail(
      {this.section,
      this.id,
      this.title,
      this.subtitle,
      this.price,
      this.description,
      this.ratedNumber,
      this.totalHours,
      this.imageUrl,
      this.promoVidUrl,
      this.updatedAt,
      this.instructorId,
      this.instructorName,
      this.instructor});

  factory NetworkCourseDetail.fromJson(Map<String, dynamic> json) =>
      _$NetworkCourseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkCourseDetailToJson(this);
}
