import 'package:flutter/foundation.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/chapter.dart';

class Course {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final double ratedNumber;
  final String totalMinutes;
  final String imageUrl;
  final String updateAt;
  final String level;
  final String instructorName;
  final String instructorAvatar;
  final String instructorId;
  final String description;
  final String promoVidUrl;
  final List<Chapter> chapters;
  final Author instructor;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Course(
      {@required this.id,
      @required this.title,
      @required this.subtitle,
      @required this.price,
      @required this.ratedNumber,
      @required this.totalMinutes,
      @required this.imageUrl,
      @required this.updateAt,
      @required this.level,
      @required this.instructorName,
      @required this.instructorAvatar,
      @required this.instructorId,
      @required this.description,
      @required this.promoVidUrl,
      @required this.chapters,
      @required this.instructor});

  Course copyWith({
    String id,
    String title,
    String subtitle,
    String price,
    double ratedNumber,
    String totalMinutes,
    String imageUrl,
    String updateAt,
    String level,
    String instructorName,
    String instructorAvatar,
    String instructorId,
    String description,
    String promoVidUrl,
    List<Chapter> chapters,
    Author author,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      ratedNumber: ratedNumber,
      totalMinutes: totalMinutes,
      imageUrl: imageUrl ?? this.imageUrl,
      updateAt: updateAt ?? this.updateAt,
      level: level ?? this.level,
      instructorName: instructorName ?? this.instructorName,
      instructorAvatar: instructorAvatar ?? this.instructorAvatar,
      instructorId: instructorId ?? this.instructorId,
      description: description ?? this.description,
      promoVidUrl: promoVidUrl ?? this.promoVidUrl,
      chapters: chapters ?? this.chapters,
    );
  }

  @override
  String toString() {
    return 'Course{id: $id, title: $title, subtitle: $subtitle, price: $price, ratedNumber: $ratedNumber, totalMinutes: $totalMinutes, imageUrl: $imageUrl, updateAt: $updateAt, level: $level, instructorName: $instructorName, instructorAvatar: $instructorAvatar, instructorId: $instructorId, description: $description, promoVidUrl: $promoVidUrl, chapters: $chapters}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      price.hashCode ^
      ratedNumber.hashCode ^
      totalMinutes.hashCode ^
      imageUrl.hashCode ^
      updateAt.hashCode ^
      level.hashCode ^
      instructorName.hashCode ^
      instructorAvatar.hashCode ^
      instructorId.hashCode ^
      description.hashCode ^
      promoVidUrl.hashCode ^
      chapters.hashCode;
}
