// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data/repository/author/course_repository_impl.dart';
import '../remote/source/author/author_service.dart';
import '../cache/mapper/cache_user_mapper.dart';
import '../cache/source/user/cache_user_service.dart';
import '../remote/mapper/network_author_mapper.dart';
import '../remote/mapper/network_category_mapper.dart';
import '../remote/mapper/network_course_detail_mapper.dart';
import '../remote/mapper/network_course_mapper.dart';
import '../remote/mapper/network_lesson_mapper.dart';
import '../remote/mapper/network_my_course_mapper.dart';
import '../remote/mapper/network_section_mapper.dart';
import '../remote/mapper/network_user_mapper.dart';
import '../remote/mapper/response_author_mapper.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<CacheUserMapper>(() => CacheUserMapper());
  gh.factory<CacheUserService>(() => CacheUserService());
  gh.factory<NetworkAuthorMapper>(() => NetworkAuthorMapper());
  gh.factory<NetworkCategoryMapper>(() => NetworkCategoryMapper());
  gh.factory<NetworkCourseDetailMapper>(() => NetworkCourseDetailMapper());
  gh.factory<NetworkCourseMapper>(() => NetworkCourseMapper());
  gh.factory<NetworkLessonMapper>(() => NetworkLessonMapper());
  gh.factory<NetworkMyCourseMapper>(() => NetworkMyCourseMapper());
  gh.factory<NetworkSectionMapper>(() => NetworkSectionMapper());
  gh.factory<NetworkUserMapper>(() => NetworkUserMapper());
  gh.factory<ResponseAuthorMapper>(() => ResponseAuthorMapper());
  gh.factory<AuthorRepository>(
      () => AuthorRepository(get<AuthorService>(), get<NetworkAuthorMapper>()));
  return get;
}
