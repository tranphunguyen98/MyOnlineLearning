import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_item_course.dart';

class ListCourseHorizontal extends StatelessWidget {
  final List<Course> listCourse;
  const ListCourseHorizontal(this.listCourse);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: listCourse.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ItemCourse(course: listCourse[index]),
            );
          }),
    );
  }
}
