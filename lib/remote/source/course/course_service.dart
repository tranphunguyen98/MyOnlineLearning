import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

@injectable
class CourseService {
  Future<List<NetworkCourse>> getCoursesUserFavoriteCategories(
      String userId) async {
    // Đọc file json dưới dạng chuỗi
    String jsonString = await rootBundle.loadString('sample_data/courses.json');
    //print(jsonString);
    // Giải mã file json sang Map
    List<NetworkCourse> listCourses = <NetworkCourse>[];

    listCourses = (json.decode(jsonString)["payload"] as List)
        .map((i) => NetworkCourse.fromJson(i as Map<String, dynamic>))
        .toList();
    listCourses.shuffle();
    return listCourses;
  }

  Future<List<NetworkCourse>> getTrending() async {
    // Đọc file json dưới dạng chuỗi
    String jsonString = await rootBundle.loadString('sample_data/courses.json');
    //print(jsonString);
    // Giải mã file json sang Map
    List<NetworkCourse> listCourses = <NetworkCourse>[];

    listCourses = (json.decode(jsonString)["payload"] as List)
        .map((i) => NetworkCourse.fromJson(i as Map<String, dynamic>))
        .toList();
    listCourses.shuffle();
    return listCourses;
  }

  Future<List<NetworkCourse>> getTopNew() async {
    // Đọc file json dưới dạng chuỗi
    String jsonString = await rootBundle.loadString('sample_data/courses.json');
    //print(jsonString);
    // Giải mã file json sang Map
    List<NetworkCourse> listCourses = <NetworkCourse>[];

    listCourses = (json.decode(jsonString)["payload"] as List)
        .map((i) => NetworkCourse.fromJson(i as Map<String, dynamic>))
        .toList();
    listCourses.shuffle();
    return listCourses;
  }

  Future<List<NetworkCourse>> getTopSell() async {
    // Đọc file json dưới dạng chuỗi
    String jsonString = await rootBundle.loadString('sample_data/courses.json');
    //print(jsonString);
    // Giải mã file json sang Map
    List<NetworkCourse> listCourses = <NetworkCourse>[];

    listCourses = (json.decode(jsonString)["payload"] as List)
        .map((i) => NetworkCourse.fromJson(i as Map<String, dynamic>))
        .toList();
    listCourses.shuffle();
    return listCourses;
  }
}
