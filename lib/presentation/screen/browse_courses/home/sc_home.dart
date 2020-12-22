import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/courses_bookmark.dart';
import 'package:my_online_learning/data/model/my_courses.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';
import 'package:my_online_learning/remote/source/author/author_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = getIt<ICourseRepository>();

  final authorService = getIt<AuthorService>();

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
                return Center(
                  child: Text(listCourseSnapshot.error.toString()),
                );
              } else {
                return Container(
                  height: 400.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
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
              return !userModel.user.isEmpty()
                  ? Column(
                      children: [
                        FutureBuilder<List<Course>>(
                          future: repository
                              .getMyCourses("Bearer ${userModel.user.token}"),
                          builder: (_, listCourseSnapshot) {
                            if (listCourseSnapshot.hasData) {
                              context
                                  .read<MyCourses>()
                                  .addListCourse(listCourseSnapshot.data);
                              return Consumer<MyCourses>(
                                  builder: (_, myCourse, __) {
                                return Provider<Category>(
                                  create: (_) => Category(
                                    "My Courses",
                                    myCourse.listCourse,
                                  ),
                                  child: WidgetCategoryCourse(),
                                );
                              });
                            }
                            return Container();
                          },
                        ),
                        FutureBuilder<List<Course>>(
                          future: repository.getFavoriteCourses(
                              "Bearer ${userModel.user.token}"),
                          builder: (_, listCourseSnapshot) {
                            if (listCourseSnapshot.hasData) {
                              context
                                  .read<CoursesBookmark>()
                                  .setListCourse(listCourseSnapshot.data);
                              // print(
                              //     "data: ${listCourseSnapshot?.data[0]?.title ?? "title"}");
                              return Consumer<CoursesBookmark>(
                                  builder: (_, coursesBookmark, __) {
                                return Provider<Category>(
                                  create: (_) => Category(
                                    "Bookmark",
                                    coursesBookmark.listCourse,
                                  ),
                                  child: WidgetCategoryCourse(),
                                );
                              });
                            }
                            return Container();
                          },
                        ),
                      ],
                    )
                  : Container();
            },
          ),
          // FutureBuilder<List<Author>>(
          //   future: authorService.getAuthor(),
          //   builder: (_, ListAuthorSnapshot) {
          //     if (ListAuthorSnapshot.hasData) {
          //       return Provider<List<Author>>(
          //         create: (_) => ListAuthorSnapshot.data,
          //         child: WidgetCategoryAuthor(title: "Top authors"),
          //       );
          //     }
          //     if (ListAuthorSnapshot.hasError) {
          //       return Container(
          //         child: Center(
          //           child: Text(ListAuthorSnapshot.error.toString()),
          //         ),
          //       );
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
