import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ListCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: COLOR_CONST.GRAY_DARK,
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Text(
                "New",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Expanded(child: WidgetListCourseVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
