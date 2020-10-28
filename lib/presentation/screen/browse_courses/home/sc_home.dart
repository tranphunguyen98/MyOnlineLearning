import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/widget_category_course.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'widget_category_author.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: COLOR_CONST.GRAY_DARK,
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
