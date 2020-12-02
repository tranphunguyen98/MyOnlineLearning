import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/page_search_result.dart';
import 'package:provider/provider.dart';

class TabCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultModel>(
      builder: (_, searchResult, __) => PageSearchResult(
        searchResult.data.listCourse.length,
        WidgetListCourseVertical(
          listCourse: searchResult.data.listCourse,
        ),
      ),
    );
  }
}
