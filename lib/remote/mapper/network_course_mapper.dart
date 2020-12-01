import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

@injectable
class NetworkCourseMapper implements NetworkMapper<NetworkCourse, Course> {
  @override
  Course mapFromRemote(NetworkCourse type) {
    return Course(
        id: type.id,
        title: type.title,
        ratedNumber: type.ratedNumber.toDouble(),
        imageUrl: type.imageUrl,
        subtitle: type.subtitle,
        description: "${type.title} ${type.description}",
        instructorName: type.instructorName ?? "1",
        instructorAvatar: type.instructorAvatar ?? "1",
        totalMinutes: type.totalHours * 60,
        level: "Beginner",
        createdAt:
            getIt.get<DateFormat>().format(DateTime.parse(type.createdAt)));
  }

  @override
  NetworkCourse mapToRemote(Course type) {
    return NetworkCourse(
      id: type.id,
    );
  }
}
