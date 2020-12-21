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
        instructorId: type.instructorId ?? "instructorId",
        instructorName: type.instructorName ?? "instructorName",
        instructorAvatar: type.instructorId ?? "",
        totalMinutes: (type.totalHours * 60).toStringAsFixed(2),
        level: "Beginner",
        updateAt:
            getIt.get<DateFormat>().format(DateTime.parse(type.updatedAt)));
  }

  @override
  NetworkCourse mapToRemote(Course type) {
    return NetworkCourse(
      id: type.id,
    );
  }
}
