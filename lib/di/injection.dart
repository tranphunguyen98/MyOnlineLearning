import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:my_online_learning/data/repository/course/course_repository_impl.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';
import 'package:my_online_learning/remote/source/course/course_service.dart';
import 'package:my_online_learning/remote/source/course/remote_course_data_source_impl.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  $initGetIt(getIt);
  getIt.registerLazySingleton<DateFormat>(() => DateFormat('MMM yyyy'));

  getIt.registerFactory<RemoteCourseDataSource>(() {
    return RemoteCourseDataSourceImplement(
      getIt.get<CourseService>(),
      getIt.get<NetworkCourseMapper>(),
    );
  });
  getIt.registerFactory<ICourseRepository>(
      () => CourseRepositoryImplement(getIt.get<RemoteCourseDataSource>()));
}
