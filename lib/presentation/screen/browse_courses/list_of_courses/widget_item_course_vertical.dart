import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_column_info_course.dart';

class ItemCourseVertical extends StatelessWidget {
  final Course course;

  const ItemCourseVertical({this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(course.imageUrl),
          width: 80.0,
          height: 60.0,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: WidgetColumnInfoCourse(
            course: course,
          ),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        )
      ],
    );
  }
}
