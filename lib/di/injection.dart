import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:my_online_learning/cache/mapper/cache_user_mapper.dart';
import 'package:my_online_learning/cache/source/user/cache_user_data_source_impl.dart';
import 'package:my_online_learning/cache/source/user/cache_user_service.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_data_source.dart';
import 'package:my_online_learning/data/repository/authentication/authentication_repository_impl.dart';
import 'package:my_online_learning/data/repository/authentication/i_authentication_repository.dart';
import 'package:my_online_learning/data/repository/course/course_repository_impl.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/data/repository/user/cache_user_data_source.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/data/repository/user/remote_user_data_source.dart';
import 'package:my_online_learning/data/repository/user/user_repository_impl.dart';
import 'package:my_online_learning/remote/mapper/network_author_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_category_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_course_detail_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_my_course_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_user_mapper.dart';
import 'package:my_online_learning/remote/source/authentication/authentication_data_source_impl.dart';
import 'package:my_online_learning/remote/source/authentication/authentication_service.dart';
import 'package:my_online_learning/remote/source/author/author_service.dart';
import 'package:my_online_learning/remote/source/course/course_service.dart';
import 'package:my_online_learning/remote/source/course/remote_course_data_source_impl.dart';
import 'package:my_online_learning/remote/source/user/remote_user_data_source_impl.dart';
import 'package:my_online_learning/remote/source/user/user_service.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  $initGetIt(getIt);
  final baseUrl = "http://api.dev.letstudy.org/";
  getIt.registerLazySingleton<DateFormat>(() => DateFormat('MMM yyyy'));
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(getIt.get<Dio>()));

  getIt.registerLazySingleton<AuthenticationDataSource>(() =>
      AuthenticationDataSourceImplement(
          getIt.get<AuthenticationService>(), getIt.get<NetworkUserMapper>()));

  getIt.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepositoryImplement(getIt<AuthenticationDataSource>()));

  getIt.registerLazySingleton(() => CourseService(getIt<Dio>()));

  getIt.registerLazySingleton<RemoteCourseDataSource>(() {
    return RemoteCourseDataSourceImplement(
      getIt.get<CourseService>(),
      getIt.get<NetworkCourseMapper>(),
      getIt.get<NetworkMyCourseMapper>(),
      getIt.get<NetworkCourseDetailMapper>(),
      getIt.get<NetworkCategoryMapper>(),
      getIt.get<NetworkAuthorMapper>(),
    );
  });

  getIt.registerLazySingleton<ICourseRepository>(
      () => CourseRepositoryImplement(getIt.get<RemoteCourseDataSource>()));

  getIt.registerSingleton<AuthorService>(AuthorService(getIt<Dio>()));

  // USER

  getIt.registerLazySingleton<UserService>(() => UserService(getIt<Dio>()));

  getIt.registerLazySingleton<CacheUserDataSource>(
    () => CacheUserDataSourceImplement(
      getIt<CacheUserService>(),
      getIt<CacheUserMapper>(),
    ),
  );

  getIt.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSourceImplement(
      getIt<UserService>(),
      getIt<NetworkUserMapper>(),
    ),
  );

  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepositoryImplement(
      getIt<CacheUserDataSource>(),
      getIt<RemoteUserDataSource>(),
    ),
  );

  // getIt.registerLazySingleton<AuthorRepository>(() =>
  //     AuthorRepository(getIt<AuthorService>(), getIt<NetworkAuthorMapper>()));
}
