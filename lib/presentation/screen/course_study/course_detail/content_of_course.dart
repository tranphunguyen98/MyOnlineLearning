import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_detail/item_section.dart';

class ContentOfCourse extends StatelessWidget {
  final Course course;
  const ContentOfCourse({Key key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("chapter ne: ${course?.chapters?.length ?? "Null"}");
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.black,
      child: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: course.chapters.length,
        itemBuilder: (context, index) {
          return ItemChapter(course.chapters[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
