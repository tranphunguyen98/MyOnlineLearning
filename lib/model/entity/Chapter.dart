import 'Lesson.dart';

class Chapter {
  final String title;
  final int duration;
  final int index;
  final bool isStudying;
  final List<Lesson> listLesson;

  const Chapter(this.title, this.duration, this.index, this.listLesson,
      {this.isStudying = false});

  String get durationString {
    int minute = duration ~/ 60;
    int second = duration % 60;
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

  static const List<Chapter> listChapter = [
    Chapter("Course Overview", 220, 1, Lesson.listLesson, isStudying: true),
    Chapter("Getting Started with Angular", 410, 2, Lesson.listLesson),
    Chapter("Exploring the Angular Template Syntax", 110, 3, Lesson.listLesson),
  ];
}
