import 'package:dio/dio.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_category_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_course_detail_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';
import 'package:my_online_learning/remote/mapper/network_my_course_mapper.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

import 'course_service.dart';

class RemoteCourseDataSourceImplement implements RemoteCourseDataSource {
  final CourseService _courseService;
  final NetworkCourseMapper _mapperCourse;
  final NetworkMyCourseMapper _mapperMyCourse;
  final NetworkCourseDetailMapper _mapperCourseDetail;
  final NetworkCategoryMapper _mapperCategory;

  RemoteCourseDataSourceImplement(this._courseService, this._mapperCourse,
      this._mapperMyCourse, this._mapperCourseDetail, this._mapperCategory);

  @override
  Future<Course> getCourseInfo(String courseId) async {
    try {
      final courseResponse = await _courseService.getCourseInfo(courseId);
      print('chapter ${courseResponse.payload?.section?.length ?? 10000}');
      return _mapperCourseDetail.mapFromRemote(courseResponse.payload);
    } on DioError catch (e) {
      print('error: $e');
      throw Exception(e.response.data["message"]);
    }
  }

  //_mapper.mapFromRemote(await _courseService.getCourseInfo(courseId));

  @override
  Future<List<Course>> getFavoriteCourses(String bearToken) async {
    try {
      final listCourseResponse =
          await _courseService.getFavoritesCourses(bearToken);
      return listCourseResponse.payload
              .map((e) => _mapperMyCourse.mapFromRemote(e))
              .toList() ??
          <Course>[];
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Course>> getMyCourses(String bearToken) async {
    try {
      final listCourseResponse = await _courseService.getMyCourses(bearToken);
      return listCourseResponse.payload
              .map((e) => _mapperMyCourse.mapFromRemote(e))
              .toList() ??
          <Course>[];
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<Course> getDetailWithLesson(String courseId) {
    // TODO: implement getDetailWithLesson
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getTopNew() async {
    try {
      final listCourseResponse = await _courseService.getTopNew(10, 1);
      print('test ${listCourseResponse.message}');
      return listCourseResponse.payload
          .map((e) => _mapperCourse.mapFromRemote(e))
          .toList();
    } on DioError catch (e) {
      print('test ${e}');
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Course>> getTopRate() async {
    try {
      final listCourseResponse = await _courseService.getTopRate(10, 1);
      return listCourseResponse.payload
          .map((e) => _mapperCourse.mapFromRemote(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Course>> getTopSell() async {
    try {
      final listCourseResponse = await _courseService.getTopSell(10, 1);
      return listCourseResponse.payload
          .map((e) => _mapperCourse.mapFromRemote(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Course>> searchV2(String token, String keyword) async {
    try {
      final listCourseSearchResponse =
          await _courseService.searchV2(token, keyword, 10, 1);
      final resultCourses =
          listCourseSearchResponse.payload.rows ?? <NetworkCourse>[];
      return resultCourses.map((e) => _mapperCourse.mapFromRemote(e)).toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Course>> search(String keyword) async {
    try {
      final listCourseSearchResponse =
          await _courseService.search(keyword, 10, 1);
      final resultCourses =
          listCourseSearchResponse.payload.rows ?? <NetworkCourse>[];
      return resultCourses.map((e) {
        print(e.toString());
        return _mapperCourse.mapFromRemote(e);
      }).toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<bool> enrollCourse(String bearToken, String courseId) async {
    try {
      final messageResponse =
          await _courseService.enrollCourse(bearToken, courseId);
      print("Enroll ${messageResponse}");
      if (messageResponse.message == null || messageResponse.message.isEmpty) {
        return true;
      } else {
        throw Exception(messageResponse.message);
      }
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<bool> likeCourse(String bearToken, String courseId) async {
    try {
      final messageResponse =
          await _courseService.likeCourse(bearToken, courseId);
      print("Like ${messageResponse.message}");
      if (messageResponse.message == "OK") {
        return true;
      } else {
        throw Exception(messageResponse.message);
      }
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      final categoryResponse = await _courseService.getCategories();
      return categoryResponse.payload
          .map((e) => _mapperCategory.mapFromRemote(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }
}
