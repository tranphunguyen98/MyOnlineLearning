import 'package:injectable/injectable.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_my_course.dart';

@injectable
class NetworkMyCourseMapper implements NetworkMapper<NetworkMyCourse, Course> {
  @override
  Course mapFromRemote(NetworkMyCourse type) {
    return Course(
        id: type.id,
        title: type.courseTitle,
        imageUrl: type.courseImage,
        instructorId: type.instructorId ?? "instructorId",
        instructorName: type.instructorName ?? "Name",
        level: "Beginner");
  }

  @override
  NetworkMyCourse mapToRemote(Course type) {
    return NetworkMyCourse(
      id: type.id,
    );
  }
}
