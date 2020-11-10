import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/Chapter.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_detail/sc_course_detail.dart';

class ContentOfCourse extends StatelessWidget {
  const ContentOfCourse({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.black,
      child: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: Chapter.listChapter.length,
        itemBuilder: (context, index) {
          return ItemChapter(Chapter.listChapter[index]);
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
