import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_column_info_course.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_detail/sc_course_detail.dart';
import 'package:my_online_learning/utils/extensions.dart';

class ItemCourseVerticalDivider extends StatelessWidget {
  final Course course;

  const ItemCourseVerticalDivider({this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.push(CourseDetailScreen(course.id));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(course.imageUrl),
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            color: Colors.white60,
            height: 8,
          ),
        )
      ],
    );
  }
}
