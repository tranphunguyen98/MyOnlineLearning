class Lesson {
  final String id;
  final String courseId;
  final String sectionId;
  final int numberOrder;
  final String name;
  final String videoUrl;
  final int minutes;
  final bool isStudying;

  const Lesson({
    this.id,
    this.courseId,
    this.sectionId,
    this.numberOrder,
    this.name,
    this.videoUrl,
    this.minutes,
    this.isStudying,
  });

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
}
