import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/course.dart';

class CourseRepositoryImplement implements ICourseRepository {
  final RemoteCourseDataSource _remoteDataSource;

  CourseRepositoryImplement(this._remoteDataSource);

  @override
  Future<Course> getCourseInfo(String courseId) {
    // TODO: implement getCourseInfo
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getCoursesUserFavoriteCategories(String userId) =>
      _remoteDataSource.getCoursesUserFavoriteCategories(userId);

  @override
  Future<Course> getDetailWithLesson(String courseId) {
    // TODO: implement getDetailWithLesson
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getTopNew() {
    // TODO: implement getTopNew
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getTopRate() {
    // TODO: implement getTopRate
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getTopSell() {
    // TODO: implement getTopSell
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> search(String courseId) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
