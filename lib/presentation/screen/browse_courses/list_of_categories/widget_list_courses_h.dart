import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:provider/provider.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_item_course.dart';

class ListCourseHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Category>(
      builder: (_, category, __) => Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16.0),
        height: 240,
        child: category.courses.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: category.courses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ItemCourse(course: category.courses[index]),
                  );
                })
            : Center(child: Text("NO DATA")),
      ),
    );
  }
}
