import 'package:dio/dio.dart';
import 'package:my_online_learning/remote/model/list_course_response.dart';
import 'package:my_online_learning/remote/model/network_course.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: "http://api.dev.letstudy.org/")
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  @GET("/user/intro-page")
  Future<NetworkCourse> getCourseInfo(String courseId);

  @GET("/user/intro-page")
  Future<List<NetworkCourse>> getCoursesUserFavoriteCategories(String userId);

  @POST("/course/top-rate")
  Future<ListCourseResponse> getTopRate(@Field() int limit, @Field() int page);

  @POST("/course/top-new")
  Future<ListCourseResponse> getTopNew(@Field() int limit, @Field() int page);

  @POST("/course/top-sell")
  Future<ListCourseResponse> getTopSell(@Field() int limit, @Field() int page);

  @GET("/user/intro-page")
  Future<void> search(String data);
}
