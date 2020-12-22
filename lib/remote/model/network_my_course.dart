import 'package:flutter/foundation.dart';

class NetworkMyCourse {
  final String id;
  final String courseTitle;
  final String courseImage;
  final String instructorId;
  final String instructorName;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const NetworkMyCourse({
    @required this.id,
    @required this.courseTitle,
    @required this.courseImage,
    @required this.instructorId,
    @required this.instructorName,
  });

  NetworkMyCourse copyWith({
    String id,
    String courseTitle,
    String courseImage,
    String instructorId,
    String instructorName,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (courseTitle == null || identical(courseTitle, this.courseTitle)) &&
        (courseImage == null || identical(courseImage, this.courseImage)) &&
        (instructorId == null || identical(instructorId, this.instructorId)) &&
        (instructorName == null ||
            identical(instructorName, this.instructorName))) {
      return this;
    }

    return new NetworkMyCourse(
      id: id ?? this.id,
      courseTitle: courseTitle ?? this.courseTitle,
      courseImage: courseImage ?? this.courseImage,
      instructorId: instructorId ?? this.instructorId,
      instructorName: instructorName ?? this.instructorName,
    );
  }

  @override
  String toString() {
    return 'NetworkCourse{id: $id, courseTitle: $courseTitle, courseImage: $courseImage, instructorId: $instructorId, instructorName: $instructorName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NetworkMyCourse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          courseTitle == other.courseTitle &&
          courseImage == other.courseImage &&
          instructorId == other.instructorId &&
          instructorName == other.instructorName);

  @override
  int get hashCode =>
      id.hashCode ^
      courseTitle.hashCode ^
      courseImage.hashCode ^
      instructorId.hashCode ^
      instructorName.hashCode;

  factory NetworkMyCourse.fromJson(Map<String, dynamic> map) {
    return new NetworkMyCourse(
      id: map['id'] as String,
      courseTitle: map['courseTitle'] as String,
      courseImage: map['courseImage'] as String,
      instructorId: map['instructorId'] as String,
      instructorName: map['instructorName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'courseTitle': this.courseTitle,
      'courseImage': this.courseImage,
      'instructorId': this.instructorId,
      'instructorName': this.instructorName,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
