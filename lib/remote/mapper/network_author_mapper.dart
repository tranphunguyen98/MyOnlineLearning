import 'package:injectable/injectable.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_mapper.dart';
import 'package:my_online_learning/remote/model/network_author.dart';

@Injectable()
class NetworkAuthorMapper implements NetworkMapper<NetworkAuthor, Author> {
  final courseMapper = getIt<NetworkCourseMapper>();
  @override
  Author mapFromRemote(NetworkAuthor type) {
    print(type);
    return Author(
      id: type.id,
      avatar: type.avatar,
      name: type.name,
      courses: (type.courses ?? [])
          .map((e) => courseMapper.mapFromRemote(e))
          .toList(),
      numberCourses: type.numcourses,
    );
  }

  @override
  NetworkAuthor mapToRemote(Author type) {
    return NetworkAuthor(
      id: type.id,
      avatar: type.avatar,
      name: type.name,
      courses: type.courses.map((e) => courseMapper.mapToRemote(e)).toList(),
    );
  }
}
