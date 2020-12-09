import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';
import 'package:my_online_learning/remote/source/author/author_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final repository = getIt<ICourseRepository>();
  final authorService = getIt<AuthorSevice>();

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
          // Consumer<UserModel>(
          //   builder: (_, userModel, __) {
          //     return !userModel.user.isEmpty()
          //         ? Column(
          //             children: [
          //               FutureBuilder<List<Course>>(
          //                 future: repository.getCoursesUserFavoriteCategories(
          //                     userModel.user.id),
          //                 builder: (_, listCourseSnapshot) {
          //                   if (listCourseSnapshot.hasData) {
          //                     return Provider<Category>(
          //                       create: (_) => Category(
          //                           "My Courses", listCourseSnapshot.data),
          //                       child: const WidgetCategoryCourse(),
          //                     );
          //                   }
          //                   if (listCourseSnapshot.hasError) {
          //                     return Container(
          //                       child: Center(
          //                         child:
          //                             Text(listCourseSnapshot.error.toString()),
          //                       ),
          //                     );
          //                   } else {
          //                     return Container();
          //                   }
          //                 },
          //               ),
          //               Consumer<CoursesBookmark>(
          //                   builder: (_, coursesBookmark, __) {
          //                 print(
          //                     "sc_hie" + coursesBookmark.listCourse.toString());
          //                 return Provider<Category>(
          //                   create: (_) => Category(
          //                     "Bookmark",
          //                     coursesBookmark.listCourse,
          //                   ),
          //                   child: WidgetCategoryCourse(),
          //                 );
          //               }),
          //             ],
          //           )
          //         : Container();
          //   },
          // ),
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
