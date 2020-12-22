import 'package:dio/dio.dart';
import 'package:my_online_learning/remote/model/response/course_detail_response.dart';
import 'package:my_online_learning/remote/model/response/list_course_response.dart';
import 'package:my_online_learning/remote/model/response/list_course_search_response.dart';
import 'package:my_online_learning/remote/model/response/my_course_response.dart';
import 'package:my_online_learning/remote/model/response/response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: "http://api.dev.letstudy.org/")
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  @POST("/payment/get-free-courses")
  Future<MessageResponse> enrollCourse(
      @Header("Authorization") String bearToken, @Field() String courseId);

  @POST("/user/like-course")
  Future<MessageResponse> likeCourse(
      @Header("Authorization") String bearToken, @Field() String courseId);

  @GET("/course/get-course-detail/{id}/null")
  Future<CourseDetailResponse> getCourseInfo(@Path("id") String id);

  @POST("/course/top-rate")
  Future<ListCourseResponse> getTopRate(@Field() int limit, @Field() int page);

  @POST("/course/top-new")
  Future<ListCourseResponse> getTopNew(@Field() int limit, @Field() int page);

  @POST("/course/top-sell")
  Future<ListCourseResponse> getTopSell(@Field() int limit, @Field() int page);

  @GET("/user/get-favorite-courses")
  Future<MyCourseResponse> getFavoritesCourses(
      @Header("Authorization") String bearToken);

  @GET("/user/get-process-courses")
  Future<MyCourseResponse> getMyCourses(
      @Header("Authorization") String bearToken);

  @POST("/course/searchV2")
  Future<ListCourseSearchResponse> searchV2(
    @Field() String token,
    @Field() String keyword,
    @Field() int limit,
    @Field() int offset,
  );

  @POST("/course/search")
  Future<ListCourseSearchResponse> search(
    @Field() String keyword,
    @Field() int limit,
    @Field() int offset,
  );
}
