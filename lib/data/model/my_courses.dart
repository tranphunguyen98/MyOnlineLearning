import 'package:flutter/cupertino.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/course.dart';

class MyCourses extends ChangeNotifier {
  final List<Course> _listcourses = <Course>[];

  List<Course> get listCourse => _listcourses;

  void addListCourse(List<Course> listCourse) {
    _listcourses.clear();
    if (listCourse.isNotEmpty) {
      _listcourses.addAll(listCourse);
    }
    notifyListeners();
  }

  Future<bool> enrollCourse(String token, Course course) async {
    try {
      print("token ne $token");
      await getIt.get<ICourseRepository>().enrollCourse(token, course.id);
      print("token ne1");
      addCourse(course.copyWith(
        ratedNumber: null,
        totalMinutes: null,
      ));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  void addCourse(Course course) {
    _listcourses.add(course);
    print("add ${course} ${_listcourses}");
    notifyListeners();
  }

  void removeCourse(Course course) {
    _listcourses.remove(course);
    notifyListeners();
  }

  void removeAll() {
    _listcourses.clear();
    notifyListeners();
  }

  bool contain(Course course) => _listcourses.contains(course);

  bool containId(String courseId) {
    final index = _listcourses.indexWhere((element) => element.id == courseId);
    print("index 11111111111 $index");
    if (index >= 0) {
      return true;
    } else {
      return false;
    }
  }
}
