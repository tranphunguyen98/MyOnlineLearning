import 'package:my_online_learning/data/repository/course/remote_course_data_source.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/mapper/network_course_mapper.dart';

import 'course_service.dart';

class RemoteCourseDataSourceImplement implements RemoteCourseDataSource {
  final CourseService _courseService;
  final NetworkCourseMapper _mapper;

  RemoteCourseDataSourceImplement(this._courseService, this._mapper);

  @override
  Future<Course> getCourseInfo(String courseId) {
    // TODO: implement getCourseInfo
    throw UnimplementedError();
  }

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
