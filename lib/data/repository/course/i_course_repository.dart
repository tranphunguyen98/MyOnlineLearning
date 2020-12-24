import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/model/option_search.dart';

abstract class ICourseRepository {
  Future<List<Course>> getTopSell();
  Future<List<Course>> getTopNew();
  Future<List<Course>> getTopRate();
  Future<List<Course>> getFavoriteCourses(String bearToken);
  Future<List<Course>> getMyCourses(String bearToken);
  Future<Course> getCourseInfo(String courseId);
  Future<Course> getDetailWithLesson(String courseId);
  Future<List<Course>> searchV2(String token, String keyword);
  Future<SearchResult> search(String keyword, OptionSearch optionSearch);
  Future<bool> enrollCourse(String bearToken, String courseId);
  Future<bool> likeCourse(String bearToken, String courseId);
  Future<List<Category>> getCategories();
}
