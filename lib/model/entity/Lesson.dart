class Lesson {
  final String title;
  final int duration;
  final bool isStudying;

  const Lesson(this.title, this.duration, {this.isStudying = false});

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

  static const List<Lesson> listLesson = [
    Lesson("Introduction", 12, isStudying: true),
    Lesson("Practice Exercises", 60),
    Lesson("Introduction to TypeScript", 90),
    Lesson("Practice Exercises", 240),
    Lesson("Introduction", 100),
    Lesson("Introduction to TypeScript", 120)
  ];
}
