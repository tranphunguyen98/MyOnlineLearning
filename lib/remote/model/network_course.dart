import 'package:flutter/foundation.dart';

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
  final String instructorName;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

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
    @required this.instructorName,
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
    String instructorName,
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
        (instructorId == null || identical(instructorId, this.instructorId)) &&
        (instructorName == null ||
            identical(instructorName, this.instructorName))) {
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
      instructorName: instructorName ?? this.instructorName,
    );
  }

  @override
  String toString() {
    return 'NetworkCourse{id: $id, title: $title, subtitle: $subtitle, price: $price, description: $description, ratedNumber: $ratedNumber, totalHours: $totalHours, imageUrl: $imageUrl, updatedAt: $updatedAt, instructorId: $instructorId, instructorName: $instructorName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NetworkCourse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          subtitle == other.subtitle &&
          price == other.price &&
          description == other.description &&
          ratedNumber == other.ratedNumber &&
          totalHours == other.totalHours &&
          imageUrl == other.imageUrl &&
          updatedAt == other.updatedAt &&
          instructorId == other.instructorId &&
          instructorName == other.instructorName);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      price.hashCode ^
      description.hashCode ^
      ratedNumber.hashCode ^
      totalHours.hashCode ^
      imageUrl.hashCode ^
      updatedAt.hashCode ^
      instructorId.hashCode ^
      instructorName.hashCode;

  factory NetworkCourse.fromJson(Map<String, dynamic> map) {
    return NetworkCourse(
      id: map['id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      ratedNumber: map['ratedNumber'] as int,
      totalHours: map['totalHours'] as double,
      imageUrl: map['imageUrl'] as String,
      updatedAt: map['updatedAt'] as String,
      instructorId: map['instructorId'] as String,
      instructorName: map['instructor.user.name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'subtitle': this.subtitle,
      'price': this.price,
      'description': this.description,
      'ratedNumber': this.ratedNumber,
      'totalHours': this.totalHours,
      'imageUrl': this.imageUrl,
      'updatedAt': this.updatedAt,
      'instructorId': this.instructorId,
      'instructor.user.name': this.instructorName,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
