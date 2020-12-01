import 'package:flutter/foundation.dart';
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
  final String instructorName;
  final String instructorAvatar;

  factory NetworkCourse.fromJson(Map<String, dynamic> json) =>
      _$NetworkCourseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCourseToJson(this);

  const NetworkCourse({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.price,
    @required this.description,
    @required this.ratedNumber,
    @required this.totalHours,
    @required this.imageUrl,
    @required this.createdAt,
    @required this.instructorId,
    @required this.instructorName,
    @required this.instructorAvatar,
  });

  NetworkCourse copyWith({
    String id,
    String title,
    String subtitle,
    int price,
    String description,
    int ratedNumber,
    int totalHours,
    String imageUrl,
    String createdAt,
    String instructorId,
    String instructorName,
    String instructorAvatar,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (subtitle == null || identical(subtitle, this.subtitle)) &&
        (price == null || identical(price, this.price)) &&
        (description == null || identical(description, this.description)) &&
        (ratedNumber == null || identical(ratedNumber, this.ratedNumber)) &&
        (totalHours == null || identical(totalHours, this.totalHours)) &&
        (imageUrl == null || identical(imageUrl, this.imageUrl)) &&
        (createdAt == null || identical(createdAt, this.createdAt)) &&
        (instructorId == null || identical(instructorId, this.instructorId)) &&
        (instructorName == null ||
            identical(instructorName, this.instructorName)) &&
        (instructorAvatar == null ||
            identical(instructorAvatar, this.instructorAvatar))) {
      return this;
    }

    return NetworkCourse(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      description: description ?? this.description,
      ratedNumber: ratedNumber ?? this.ratedNumber,
      totalHours: totalHours ?? this.totalHours,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      instructorId: instructorId ?? this.instructorId,
      instructorName: instructorName ?? this.instructorName,
      instructorAvatar: instructorAvatar ?? this.instructorAvatar,
    );
  }
}
