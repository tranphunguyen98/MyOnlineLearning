import 'package:dio/dio.dart';
import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

import 'course_service.dart';

class RemoteCourseDataSourceImplement implements RemoteCourseDataSource {
  final CourseService _courseService;
  final NetworkCourseMapper _mapper;

  RemoteCourseDataSourceImplement(this._courseService, this._mapper);

  @override
  Future<Course> getCourseInfo(String courseId) async =>
      _mapper.mapFromRemote(await _courseService.getCourseInfo(courseId));

  @override
  Future<List<Course>> getCoursesUserFavoriteCategories(String userId) async =>
      (await _courseService.getCoursesUserFavoriteCategories(userId))
          .map((e) => _mapper.mapFromRemote(e))
          .toList();

  @override
  Future<Course> getDetailWithLesson(String courseId) {
    // TODO: implement getDetailWithLesson
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getTopNew() async {
    try {
      final listCourseResponse = await _courseService.getTopNew(10, 1);
      return listCourseResponse.payload
          .map((e) => _mapper.mapFromRemote(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<List<Course>> getTopRate() async {
    try {
      final listCourseResponse = await _courseService.getTopRate(10, 1);
      return listCourseResponse.payload
          .map((e) => _mapper.mapFromRemote(e))
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
          .map((e) => _mapper.mapFromRemote(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }

  @override
  Future<SearchResult> searchV2(String token, String keyword) async {
    return SearchResult.empty();
  }

  @override
  Future<SearchResult> search(String keyword) async {
    try {
      final listCourseSearchResponse =
          await _courseService.search(keyword, 10, 1);
      final resultCourses =
          listCourseSearchResponse.payload.rows ?? <NetworkCourse>[];
      return SearchResult(
          resultCourses.map((e) => _mapper.mapFromRemote(e)).toList(),
          <Author>[]);
    } on DioError catch (e) {
      throw Exception(e.response.data["message"]);
    }
  }
}
