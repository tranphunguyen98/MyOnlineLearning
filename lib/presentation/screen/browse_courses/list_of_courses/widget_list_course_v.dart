import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_item_course_vertical.dart';

class WidgetListCourseVertical extends StatelessWidget {
  final bool isScroll;
  final List<Course> listCourse;

  const WidgetListCourseVertical({this.isScroll = true, this.listCourse});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: isScroll
          ? AlwaysScrollableScrollPhysics()
          : NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listCourse.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCourseVertical(
          course: listCourse[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            color: Colors.white60,
            height: 8,
          ),
        );
      },
    );
  }
}
