import 'package:flutter/foundation.dart';

class Lesson {
  final String id;
  final String courseId;
  final String sectionId;
  final int numberOrder;
  final String name;
  final String videoUrl;
  final int minutes;
  final bool isStudying;
  final double currentTime;
  final bool isFinish;
  final String videoName;

  String get durationString {
    int minute = minutes ~/ 60;
    int second = minutes.toInt() % 60;
    String result = "";
    if (minute < 10) {
      result += "0$minute:";
    } else {
      result += "$minute:";
    }

    if (second < 10) {
      result += "0$second";
    } else {
      result += "$second";
    }

    return result;
  }

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Lesson({
    @required this.id,
    @required this.courseId,
    @required this.sectionId,
    @required this.numberOrder,
    @required this.name,
    @required this.videoUrl,
    @required this.minutes,
    @required this.isStudying,
    @required this.currentTime,
    @required this.isFinish,
    @required this.videoName,
  });

  Lesson copyWith({
    String id,
    String courseId,
    String sectionId,
    int numberOrder,
    String name,
    String videoUrl,
    int minutes,
    bool isStudying,
    double currentTime,
    bool isFinish,
    String videoName,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (courseId == null || identical(courseId, this.courseId)) &&
        (sectionId == null || identical(sectionId, this.sectionId)) &&
        (numberOrder == null || identical(numberOrder, this.numberOrder)) &&
        (name == null || identical(name, this.name)) &&
        (videoUrl == null || identical(videoUrl, this.videoUrl)) &&
        (minutes == null || identical(minutes, this.minutes)) &&
        (isStudying == null || identical(isStudying, this.isStudying)) &&
        (currentTime == null || identical(currentTime, this.currentTime)) &&
        (isFinish == null || identical(isFinish, this.isFinish)) &&
        (videoName == null || identical(videoName, this.videoName))) {
      return this;
    }

    return new Lesson(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      sectionId: sectionId ?? this.sectionId,
      numberOrder: numberOrder ?? this.numberOrder,
      name: name ?? this.name,
      videoUrl: videoUrl ?? this.videoUrl,
      minutes: minutes ?? this.minutes,
      isStudying: isStudying ?? this.isStudying,
      currentTime: currentTime ?? this.currentTime,
      isFinish: isFinish ?? this.isFinish,
      videoName: videoName ?? this.videoName,
    );
  }

  @override
  String toString() {
    return 'Lesson{id: $id, courseId: $courseId, sectionId: $sectionId, numberOrder: $numberOrder, name: $name, videoUrl: $videoUrl, minutes: $minutes, isStudying: $isStudying, currentTime: $currentTime, isFinish: $isFinish, videoName: $videoName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lesson &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          courseId == other.courseId &&
          sectionId == other.sectionId &&
          numberOrder == other.numberOrder &&
          name == other.name &&
          videoUrl == other.videoUrl &&
          minutes == other.minutes &&
          isStudying == other.isStudying &&
          currentTime == other.currentTime &&
          isFinish == other.isFinish &&
          videoName == other.videoName);

  @override
  int get hashCode =>
      id.hashCode ^
      courseId.hashCode ^
      sectionId.hashCode ^
      numberOrder.hashCode ^
      name.hashCode ^
      videoUrl.hashCode ^
      minutes.hashCode ^
      isStudying.hashCode ^
      currentTime.hashCode ^
      isFinish.hashCode ^
      videoName.hashCode;

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return new Lesson(
      id: map['id'] as String,
      courseId: map['courseId'] as String,
      sectionId: map['sectionId'] as String,
      numberOrder: map['numberOrder'] as int,
      name: map['name'] as String,
      videoUrl: map['videoUrl'] as String,
      minutes: map['minutes'] as int,
      isStudying: map['isStudying'] as bool,
      currentTime: map['currentTime'] as double,
      isFinish: map['isFinish'] as bool,
      videoName: map['videoName'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'courseId': this.courseId,
      'sectionId': this.sectionId,
      'numberOrder': this.numberOrder,
      'name': this.name,
      'videoUrl': this.videoUrl,
      'minutes': this.minutes,
      'isStudying': this.isStudying,
      'currentTime': this.currentTime,
      'isFinish': this.isFinish,
      'videoName': this.videoName,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
