import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/page_search_result.dart';

class TabCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageSearchResult(
      Course.listCourse.length,
      WidgetListCourseVertical(),
    );
  }
}
