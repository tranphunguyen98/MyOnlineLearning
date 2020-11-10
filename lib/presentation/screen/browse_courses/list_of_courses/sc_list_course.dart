import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

import 'widget_list_course_v.dart';

class ListCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: WidgetListCourseVertical(),
        ),
      ),
    );
  }
}
