import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/courses_bookmark.dart';
import 'package:my_online_learning/data/model/courses_download.dart';
import 'package:my_online_learning/data/model/my_courses.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'item_function_detail.dart';

class RowFunction extends StatefulWidget {
  final Course course;

  RowFunction(this.course);

  @override
  _RowFunctionState createState() => _RowFunctionState();
}

class _RowFunctionState extends State<RowFunction> {
  bool downloading = false;
  String progressString = "0%";

  Future<void> downloadFile(String url) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      print("path ${dir.path}");
      await dio.download(url, "${dir.path}/demo.mp4",
          onReceiveProgress: (rec, total) {
        // print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

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
                coursesBookmark.contain(widget.course)
                    ? "Bookmarked"
                    : "Bookmark",
                Icons.bookmark,
                coursesBookmark.contain(widget.course)
                    ? () {
                        coursesBookmark.removeCourse(
                            "Bearer ${userModel.user.token}", widget.course);
                      }
                    : () {
                        coursesBookmark.addCourse(
                            "Bearer ${userModel.user.token}", widget.course);
                      },
              ),
            ),
            Consumer<MyCourses>(
              builder: (context, myCourses, child) => ItemFunctionDetail(
                  myCourses.contain(widget.course) ? "Enrolled" : "Enroll",
                  Icons.control_point,
                  myCourses.contain(widget.course)
                      ? null
                      : () async {
                          try {
                            await myCourses.enrollCourse(
                                "Bearer ${userModel.user.token}",
                                widget.course);
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
                  coursesDownload.contain(widget.course)
                      ? "Downloaded"
                      : downloading
                          ? progressString
                          : "Download",
                  Icons.download_rounded,
                  coursesDownload.contain(widget.course)
                      ? null
                      : () async {
                          await downloadFile(widget.course.promoVidUrl);
                          coursesDownload.addCourse(widget.course);
                        }),
            ),
          ],
        ),
      ),
    );
  }
}
