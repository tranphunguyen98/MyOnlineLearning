import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/model/option_search.dart';

class CourseRepositoryImplement implements ICourseRepository {
  final RemoteCourseDataSource _remoteDataSource;

  CourseRepositoryImplement(this._remoteDataSource);

  @override
  Future<Course> getCourseInfo(String courseId) =>
      _remoteDataSource.getCourseInfo(courseId);

  @override
  Future<List<Course>> getFavoriteCourses(String bearToken) =>
      _remoteDataSource.getFavoriteCourses(bearToken);

  @override
  Future<Course> getDetailWithLesson(String courseId) =>
      _remoteDataSource.getDetailWithLesson(courseId);

  @override
  Future<List<Course>> getTopNew() => _remoteDataSource.getTopNew();

  @override
  Future<List<Course>> getTopRate() => _remoteDataSource.getTopRate();

  @override
  Future<List<Course>> getTopSell() => _remoteDataSource.getTopSell();

  @override
  Future<List<Course>> searchV2(String token, String keyword) =>
      _remoteDataSource.searchV2(token, keyword);

  @override
  Future<List<Course>> search(String keyword, OptionSearch optionSearch) =>
      _remoteDataSource.search(keyword, optionSearch);

  @override
  Future<List<Course>> getMyCourses(String bearToken) =>
      _remoteDataSource.getMyCourses(bearToken);

  @override
  Future<bool> enrollCourse(String bearToken, String courseId) =>
      _remoteDataSource.enrollCourse(bearToken, courseId);

  @override
  Future<bool> likeCourse(String bearToken, String courseId) =>
      _remoteDataSource.likeCourse(bearToken, courseId);

  @override
  Future<List<Category>> getCategories() => _remoteDataSource.getCategories();
}
