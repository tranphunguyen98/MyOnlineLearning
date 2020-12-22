import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/courses_bookmark.dart';
import 'package:my_online_learning/data/model/courses_download.dart';
import 'package:my_online_learning/data/model/my_courses.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:provider/provider.dart';

import 'item_function_detail.dart';

class RowFunction extends StatelessWidget {
  final Course course;

  RowFunction(this.course);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, userModel, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<CoursesBookmark>(
              builder: (_, coursesBookmark, __) => ItemFunctionDetail(
                coursesBookmark.contain(course) ? "Bookmarked" : "Bookmark",
                Icons.bookmark,
                coursesBookmark.contain(course)
                    ? () {
                        coursesBookmark.removeCourse(
                            "Bearer ${userModel.user.token}", course);
                      }
                    : () {
                        coursesBookmark.addCourse(
                            "Bearer ${userModel.user.token}", course);
                      },
              ),
            ),
            Consumer<MyCourses>(
              builder: (context, myCourses, child) => ItemFunctionDetail(
                  myCourses.contain(course) ? "Enrolled" : "Enroll",
                  Icons.control_point,
                  myCourses.contain(course)
                      ? null
                      : () async {
                          try {
                            await myCourses.enrollCourse(
                                "Bearer ${userModel.user.token}", course);
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialogSimple(
                                    "Enroll", "Enroll successful"));
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialogSimple(
                                    "Enroll", "Enroll failed: $e"));
                          }
                        }),
            ),
            Consumer<CoursesDownload>(
              builder: (_, coursesDownload, __) => ItemFunctionDetail(
                  coursesDownload.contain(course) ? "Downloaded" : "Download",
                  Icons.download_rounded,
                  coursesDownload.contain(course)
                      ? null
                      : () {
                          coursesDownload.addCourse(course);
                        }),
            ),
          ],
        ),
      ),
    );
  }
}
