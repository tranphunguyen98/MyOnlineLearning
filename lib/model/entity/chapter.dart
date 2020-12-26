import 'package:flutter/foundation.dart';

import 'lesson.dart';

class Chapter {
  final String id;
  final String courseId;
  final String name;
  final int sumMinutes;
  final int numberOrder;
  final bool isStudying;
  final List<Lesson> listLesson;

  String get durationString {
    int minute = sumMinutes ~/ 60;
    int second = sumMinutes.toInt() % 60;
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

  const Chapter({
    @required this.id,
    @required this.courseId,
    @required this.name,
    @required this.sumMinutes,
    @required this.numberOrder,
    @required this.isStudying,
    @required this.listLesson,
  });

  Chapter copyWith({
    String id,
    String courseId,
    String name,
    int sumMinutes,
    int numberOrder,
    bool isStudying,
    List<Lesson> listLesson,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (courseId == null || identical(courseId, this.courseId)) &&
        (name == null || identical(name, this.name)) &&
        (sumMinutes == null || identical(sumMinutes, this.sumMinutes)) &&
        (numberOrder == null || identical(numberOrder, this.numberOrder)) &&
        (isStudying == null || identical(isStudying, this.isStudying)) &&
        (listLesson == null || identical(listLesson, this.listLesson))) {
      return this;
    }

    return new Chapter(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      name: name ?? this.name,
      sumMinutes: sumMinutes ?? this.sumMinutes,
      numberOrder: numberOrder ?? this.numberOrder,
      isStudying: isStudying ?? this.isStudying,
      listLesson: listLesson ?? this.listLesson,
    );
  }

  @override
  String toString() {
    return 'Chapter{id: $id, courseId: $courseId, name: $name, sumMinutes: $sumMinutes, numberOrder: $numberOrder, isStudying: $isStudying, listLesson: $listLesson}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          courseId == other.courseId &&
          name == other.name &&
          sumMinutes == other.sumMinutes &&
          numberOrder == other.numberOrder &&
          isStudying == other.isStudying &&
          listLesson == other.listLesson);

  @override
  int get hashCode =>
      id.hashCode ^
      courseId.hashCode ^
      name.hashCode ^
      sumMinutes.hashCode ^
      numberOrder.hashCode ^
      isStudying.hashCode ^
      listLesson.hashCode;

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return new Chapter(
      id: map['id'] as String,
      courseId: map['courseId'] as String,
      name: map['name'] as String,
      sumMinutes: map['sumMinutes'] as int,
      numberOrder: map['numberOrder'] as int,
      isStudying: map['isStudying'] as bool,
      listLesson: map['listLesson'] as List<Lesson>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'courseId': this.courseId,
      'name': this.name,
      'sumMinutes': this.sumMinutes,
      'numberOrder': this.numberOrder,
      'isStudying': this.isStudying,
      'listLesson': this.listLesson,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
