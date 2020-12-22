import 'lesson.dart';

class Chapter {
  final String id;
  final String courseId;
  final String name;
  final int sumMinutes;
  final int numberOrder;
  final bool isStudying;
  final List<Lesson> listLesson;

  const Chapter(
      {this.name,
      this.sumMinutes,
      this.numberOrder,
      this.listLesson,
      this.id,
      this.courseId,
      this.isStudying = false});

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
}
