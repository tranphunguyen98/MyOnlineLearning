import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/course.dart';

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
          //WidgetCategoryCourse(title: "My Courses"),
          FutureBuilder<List<Course>>(
            future: repository.getCoursesUserFavoriteCategories("userId"),
            builder: (_, listCourseSnapshot) {
              if (listCourseSnapshot.hasData) {
                return WidgetCategoryCourse(
                  title: "New",
                  listCourse: listCourseSnapshot.data,
                );
              }
              if (listCourseSnapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text(listCourseSnapshot.error.toString()),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          //WidgetCategoryCourse(title: "Trending"),
          // WidgetCategoryCourse(title: "Suggest For You"),
          // WidgetCategoryCourse(title: "Bookmark"),
          WidgetCategoryAuthor(title: "Top authors"),
        ],
      ),
    );
  }
}
