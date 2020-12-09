import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/course.dart';

class CourseRepositoryImplement implements ICourseRepository {
  final RemoteCourseDataSource _remoteDataSource;

  CourseRepositoryImplement(this._remoteDataSource);

  @override
  Future<Course> getCourseInfo(String courseId) =>
      _remoteDataSource.getCourseInfo(courseId);

  @override
  Future<List<Course>> getCoursesUserFavoriteCategories(String userId) =>
      _remoteDataSource.getCoursesUserFavoriteCategories(userId);

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
  Future<SearchResult> searchV2(String token, String keyword) =>
      _remoteDataSource.searchV2(token, keyword);

  @override
  Future<SearchResult> search(String keyword) =>
      _remoteDataSource.search(keyword);
}
