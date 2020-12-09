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
  final double totalHours;
  final String imageUrl;
  final String updatedAt;
  final String instructorId;

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
    @required this.updatedAt,
    @required this.instructorId,
    // @required this.instructorName,
    // @required this.instructorAvatar,
  });

  NetworkCourse copyWith({
    String id,
    String title,
    String subtitle,
    int price,
    String description,
    int ratedNumber,
    double totalHours,
    String imageUrl,
    String updatedAt,
    String instructorId,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (title == null || identical(title, this.title)) &&
        (subtitle == null || identical(subtitle, this.subtitle)) &&
        (price == null || identical(price, this.price)) &&
        (description == null || identical(description, this.description)) &&
        (ratedNumber == null || identical(ratedNumber, this.ratedNumber)) &&
        (totalHours == null || identical(totalHours, this.totalHours)) &&
        (imageUrl == null || identical(imageUrl, this.imageUrl)) &&
        (updatedAt == null || identical(updatedAt, this.updatedAt)) &&
        (instructorId == null || identical(instructorId, this.instructorId))) {
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
      updatedAt: updatedAt ?? this.updatedAt,
      instructorId: instructorId ?? this.instructorId,
    );
  }

  @override
  String toString() {
    return 'NetworkCourse{id: $id, title: $title, subtitle: $subtitle, price: $price, description: $description, ratedNumber: $ratedNumber, totalHours: $totalHours, imageUrl: $imageUrl, updatedAt: $updatedAt, instructorId: $instructorId}';
  }
}
