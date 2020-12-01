import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/courses_download.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/widget_list_course_v.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:provider/provider.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesDownload>(
      builder: (_, coursesDownload, __) => Container(
//        color: COLOR_CONST.BACKGROUND_DARK,
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "${coursesDownload.listCourse.length} Courses",
                    style: context.textTheme.subtitle2,
                  ),
                ),
                FlatButton(
                  onPressed: coursesDownload.listCourse.isNotEmpty
                      ? () {
                          coursesDownload.removeAll();
                        }
                      : null,
                  child: Text(
                    "REMOVE ALL",
                    style: StyleConst.textMediumPrimary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: WidgetListCourseVertical(
                  listCourse: coursesDownload.listCourse,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
