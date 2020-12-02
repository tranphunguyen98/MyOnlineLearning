import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';

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
  Future<List<Course>> getTopNew() async => (await _courseService.getTopNew())
      .map((e) => _mapper.mapFromRemote(e))
      .toList();

  @override
  Future<List<Course>> getTopRate() async => (await _courseService.getTopNew())
      .map((e) => _mapper.mapFromRemote(e))
      .toList();

  @override
  Future<List<Course>> getTopSell() async => (await _courseService.getTopSell())
      .map((e) => _mapper.mapFromRemote(e))
      .toList();

  @override
  Future<SearchResult> search(String data) => _courseService.search(data);
}
