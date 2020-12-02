import 'package:flutter/cupertino.dart';
import 'package:my_online_learning/model/entity/course.dart';

class CoursesBookmark extends ChangeNotifier {
  final List<Course> _listcourses = <Course>[];

  List<Course> get listCourse => _listcourses;

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
}
