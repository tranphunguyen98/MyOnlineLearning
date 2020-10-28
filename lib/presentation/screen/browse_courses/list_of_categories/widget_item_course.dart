import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_column_info_course.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ItemCourse extends StatelessWidget {
  final Course course;

  const ItemCourse({this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.GRAY_DARK,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Image(
              image: AssetImage(course.imageUrl),
              width: 190.0,
              height: 120.0,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WidgetColumnInfoCourse(
              course: course,
            ),
          )
        ],
      ),
    );
  }
}
