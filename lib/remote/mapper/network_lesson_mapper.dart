import 'package:injectable/injectable.dart';
import 'package:my_online_learning/model/entity/lesson.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_lesson.dart';

@injectable
class NetworkLessonMapper implements NetworkMapper<NetworkLesson, Lesson> {
  @override
  Lesson mapFromRemote(NetworkLesson type) {
    return Lesson(
      id: type.id,
      isStudying: false,
      courseId: type.courseId,
      minutes: (type.hours * 60).round(),
      name: type.name,
      numberOrder: type.numberOrder,
      sectionId: type.sectionId,
      videoUrl: type.videoUrl,
    );
  }

  @override
  NetworkLesson mapToRemote(Lesson type) {
    return NetworkLesson(
      id: type.id,
    );
  }
}
