import 'package:injectable/injectable.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/chapter.dart';
import 'package:my_online_learning/remote/mapper/network_lesson_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_chapter.dart';

@injectable
class NetworkSectionMapper implements NetworkMapper<NetworkChapter, Chapter> {
  @override
  Chapter mapFromRemote(NetworkChapter type) {
    return Chapter(
      id: type.id,
      isStudying: false,
      courseId: type.courseId,
      sumMinutes: (type.sumHours * 60).round(),
      name: type.name,
      numberOrder: type.numberOrder,
      listLesson: type.lesson
          .map((e) => getIt<NetworkLessonMapper>().mapFromRemote(e))
          .toList(),
    );
  }

  @override
  NetworkChapter mapToRemote(Chapter type) {
    return NetworkChapter(
      id: type.id,
    );
  }
}
