import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:provider/provider.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';

import '../list_of_authors/widget_category_author.dart';

class HomeScreen extends StatelessWidget {
  final repository = getIt<ICourseRepository>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          FutureBuilder<List<Course>>(
            future: repository.getTopNew(),
            builder: (_, listCourseSnapshot) {
              if (listCourseSnapshot.hasData) {
                return Provider<Category>(
                  create: (_) => Category("New", listCourseSnapshot.data),
                  child: const WidgetCategoryCourse(),
                );
              }
              if (listCourseSnapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text(listCourseSnapshot.error.toString()),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          FutureBuilder<List<Course>>(
            future: repository.getTopSell(),
            builder: (_, listCourseSnapshot) {
              if (listCourseSnapshot.hasData) {
                return Provider<Category>(
                  create: (_) => Category("Trending", listCourseSnapshot.data),
                  child: const WidgetCategoryCourse(),
                );
              }
              if (listCourseSnapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text(listCourseSnapshot.error.toString()),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          Consumer<UserModel>(
            builder: (_, userModel, __) {
              return Column(
                children: [
                  FutureBuilder<List<Course>>(
                    future: repository
                        .getCoursesUserFavoriteCategories(userModel.user.id),
                    builder: (_, listCourseSnapshot) {
                      if (listCourseSnapshot.hasData) {
                        return Provider<Category>(
                          create: (_) =>
                              Category("Bookmark", listCourseSnapshot.data),
                          child: const WidgetCategoryCourse(),
                        );
                      }
                      if (listCourseSnapshot.hasError) {
                        return Center(
                          child: Text(listCourseSnapshot.error.toString()),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  FutureBuilder<List<Course>>(
                    future: repository
                        .getCoursesUserFavoriteCategories(userModel.user.id),
                    builder: (_, listCourseSnapshot) {
                      if (listCourseSnapshot.hasData) {
                        return Provider<Category>(
                          create: (_) =>
                              Category("My Courses", listCourseSnapshot.data),
                          child: const WidgetCategoryCourse(),
                        );
                      }
                      if (listCourseSnapshot.hasError) {
                        return Container(
                          child: Center(
                            child: Text(listCourseSnapshot.error.toString()),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              );
            },
          ),
          WidgetCategoryAuthor(title: "Top authors"),
        ],
      ),
    );
  }
}
