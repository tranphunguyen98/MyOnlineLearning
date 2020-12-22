import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';

class ItemViewByLocation extends StatelessWidget {
  final Course course;

  const ItemViewByLocation(this.course);

  @override
  Widget build(BuildContext context) {
    return
        // ExpansionTile(
        // title: Text(course.title),
        // children: course.chapters.map((e) => ItemChapter(e)).toList(),
        // );
        Container();
  }
}
