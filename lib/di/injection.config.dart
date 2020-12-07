// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../remote/source/author/author_service.dart';
import '../remote/source/course/course_service.dart';
import '../remote/mapper/network_author_mapper.dart';
import '../remote/mapper/network_course_mapper.dart';
import '../remote/mapper/network_user_mapper.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<AuthorSevice>(() => AuthorSevice());
  gh.factory<CourseService>(() => CourseService());
  gh.factory<NetworkAuthorMapper>(() => NetworkAuthorMapper());
  gh.factory<NetworkCourseMapper>(() => NetworkCourseMapper());
  gh.factory<NetworkUserMapper>(() => NetworkUserMapper());
  return get;
}
