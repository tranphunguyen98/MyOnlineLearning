import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: WidgetListCourseVertical(),
              ),
            ),
          ],
        ));
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "${Course.listCourse.length} Courses",
            style: STYLE_CONST.textRegular,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "REMOVE ALL",
            style: STYLE_CONST.textMediumPrimary,
          ),
        ),
      ],
    );
  }
}
