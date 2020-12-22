import 'package:flutter/cupertino.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/course.dart';

class CoursesBookmark extends ChangeNotifier {
  final List<Course> _listcourses = <Course>[];

  List<Course> get listCourse => _listcourses;
  void setListCourse(List<Course> listCourse) {
    _listcourses.clear();
    _listcourses.addAll(listCourse);
    notifyListeners();
  }

  Future<void> addCourse(String bearToken, Course course) async {
    try {
      await getIt<ICourseRepository>().likeCourse(bearToken, course.id);
      _listcourses.add(course.copyWith(ratedNumber: null, totalMinutes: null));
      print("add ${course} ${_listcourses}");
      notifyListeners();
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCourse(String bearToken, Course course) async {
    try {
      await getIt<ICourseRepository>().likeCourse(bearToken, course.id);
      _listcourses.remove(course);
      notifyListeners();
      return;
    } catch (e) {
      rethrow;
    }
  }

  void removeAll() {
    _listcourses.clear();
    notifyListeners();
  }

  bool contain(Course course) => _listcourses.contains(course);
}
