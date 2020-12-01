import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/remote/mapper/network_author_mapper.dart';
import 'package:my_online_learning/remote/model/network_author.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

@injectable
class CourseService {
  Future<NetworkCourse> getCourseInfo(String courseId) async {
    String jsonString = await rootBundle.loadString('sample_data/courses.json');
    String jsonAuthorString =
        await rootBundle.loadString('sample_data/authors_detail.json');
    List<Author> listAuthor = <Author>[];

    listAuthor = (json.decode(jsonAuthorString)["payload"] as List)
        .map((i) => getIt<NetworkAuthorMapper>()
            .mapFromRemote(NetworkAuthor.fromJson(i as Map<String, dynamic>)))
        .toList();

    List<NetworkCourse> listCourses = <NetworkCourse>[];

    listCourses = (json.decode(jsonString)["payload"] as List)
        .map((i) => NetworkCourse.fromJson(i as Map<String, dynamic>))
        .toList();

    listCourses = listCourses
        .map((e) => e.copyWith(
              instructorName: listAuthor
                  .firstWhere((element) => element.id == e.instructorId)
                  .name,
              instructorAvatar: listAuthor
                  .firstWhere((element) => element.id == e.instructorId)
                  .avatar,
            ))
        .toList();

    return listCourses.firstWhere((element) => element.id == courseId);
  }

  Future<List<NetworkCourse>> getCoursesUserFavoriteCategories(
      String userId) async {
    String jsonString = await rootBundle.loadString('sample_data/courses.json');
    String jsonAuthorString =
        await rootBundle.loadString('sample_data/authors_detail.json');
    List<Author> listAuthor = <Author>[];

    listAuthor = (json.decode(jsonAuthorString)["payload"] as List)
        .map((i) => getIt<NetworkAuthorMapper>()
            .mapFromRemote(NetworkAuthor.fromJson(i as Map<String, dynamic>)))
        .toList();

    List<NetworkCourse> listCourses = <NetworkCourse>[];

    listCourses = (json.decode(jsonString)["payload"] as List)
        .map((i) => NetworkCourse.fromJson(i as Map<String, dynamic>))
        .toList();

    listCourses = listCourses
        .map((e) => e.copyWith(
              instructorName: listAuthor
                  .firstWhere((element) => element.id == e.instructorId)
                  .name,
              instructorAvatar: listAuthor
                  .firstWhere((element) => element.id == e.instructorId)
                  .avatar,
            ))
        .toList();

    listCourses.shuffle();
    return listCourses;
  }

  Future<List<NetworkCourse>> getTrending() =>
      getCoursesUserFavoriteCategories("");

  Future<List<NetworkCourse>> getTopNew() =>
      getCoursesUserFavoriteCategories("");

  Future<List<NetworkCourse>> getTopSell() =>
      getCoursesUserFavoriteCategories("");
}
