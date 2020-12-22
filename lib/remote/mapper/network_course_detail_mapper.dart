import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_author_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_section_mapper.dart';
import 'package:my_online_learning/remote/model/network_course_detail.dart';

@injectable
class NetworkCourseDetailMapper
    implements NetworkMapper<NetworkCourseDetail, Course> {
  @override
  Course mapFromRemote(NetworkCourseDetail type) {
    return Course(
        id: type.id,
        title: type.title,
        ratedNumber: type.ratedNumber.toDouble(),
        imageUrl: type.imageUrl,
        subtitle: type.subtitle,
        description: "${type.title} ${type.description}",
        instructorId: type.instructorId ?? "instructorId",
        instructorName: type.instructor.name ?? "Name",
        instructorAvatar: type.instructor.avatar,
        totalMinutes: (type.totalHours * 60).toStringAsFixed(2),
        level: "Beginner",
        promoVidUrl: type.promoVidUrl,
        updateAt: getIt.get<DateFormat>().format(
              DateTime.parse(type.updatedAt),
            ),
        chapters: type.section
            .map((e) => getIt<NetworkSectionMapper>().mapFromRemote(e))
            .toList(),
        instructor:
            getIt<NetworkAuthorMapper>().mapFromRemote(type.instructor));
  }

  @override
  NetworkCourseDetail mapToRemote(Course type) {
    return NetworkCourseDetail(
      id: type.id,
    );
  }
}
