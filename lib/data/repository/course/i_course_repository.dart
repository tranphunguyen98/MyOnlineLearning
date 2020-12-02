import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/model/entity/course.dart';

abstract class ICourseRepository {
  Future<List<Course>> getTopSell();
  Future<List<Course>> getTopNew();
  Future<List<Course>> getTopRate();
  Future<List<Course>> getCoursesUserFavoriteCategories(String userId);
  Future<Course> getCourseInfo(String courseId);
  Future<Course> getDetailWithLesson(String courseId);
  Future<SearchResult> search(String data);
}
