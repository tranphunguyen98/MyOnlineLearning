import 'package:flutter/material.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';

import '../list_of_authors/widget_category_author.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          WidgetCategoryCourse(title: "My Courses"),
          WidgetCategoryCourse(title: "New"),
          WidgetCategoryCourse(title: "Trending"),
          WidgetCategoryCourse(title: "Suggest For You"),
          WidgetCategoryCourse(title: "Bookmark"),
          WidgetCategoryAuthor(title: "Top authors"),
        ],
      ),
    );
  }
}
