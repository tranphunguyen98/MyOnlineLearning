import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';

import '../list_of_authors/widget_category_author.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: COLOR_CONST.GRAY_DARK,
        actions: [
          Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              WidgetCategoryCourse(title: "New"),
              WidgetCategoryCourse(title: "Trending"),
              WidgetCategoryAuthor(
                title: "Top authors",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
