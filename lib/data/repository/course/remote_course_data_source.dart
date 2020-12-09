import 'package:my_online_learning/model/entity/course.dart';

abstract class RemoteCourseDataSource {
  Future<List<Course>> getTopSell();
  Future<List<Course>> getTopNew();
  Future<List<Course>> getTopRate();
  Future<List<Course>> getCoursesUserFavoriteCategories(String userId);
  Future<Course> getCourseInfo(String courseId);
  Future<Course> getDetailWithLesson(String courseId);
  Future<List<Course>> searchV2(String token, String keyword);
  Future<List<Course>> search(String keyword);
}
