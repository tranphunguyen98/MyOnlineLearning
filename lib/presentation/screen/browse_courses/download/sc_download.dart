import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//        color: COLOR_CONST.BACKGROUND_DARK,
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: WidgetListCourseVertical(),
              ),
            ),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "${Course.listCourse.length} Courses",
            style: context.textTheme.subtitle2,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "REMOVE ALL",
            style: StyleConst.textMediumPrimary,
          ),
        ),
      ],
    );
  }
}
