import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/Chapter.dart';
import 'package:my_online_learning/model/entity/course.dart';

import 'item_view_by_location.dart';

class ListLessonByLocation extends StatelessWidget {
  final List<Course> courses;
  const ListLessonByLocation({
    Key key,
    @required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.black,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: Chapter.listChapter.length,
        itemBuilder: (context, index) {
          return ItemViewByLocation(courses[index]);
        },
      ),
    );
  }
}
