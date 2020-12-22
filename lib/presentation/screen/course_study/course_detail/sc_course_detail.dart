import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_network.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_authors/sc_detail_author.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_detail/row_function_widget.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_detail/video_view.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'WidgetButtonIcon.dart';
import 'content_of_course.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseId;

  const CourseDetailScreen(this.courseId);

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  Course course;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Course>(
        future: getIt<ICourseRepository>().getCourseInfo(widget.courseId),
        builder: (_, courseSnapshot) {
          if (courseSnapshot.hasData) {
            course = courseSnapshot.data;
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body: Column(
                children: [
                  VideoView(
                    course,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildHeaderInfo(),
                        RowFunction(course),
                        _buildDescription(),
                        //_buildButtonFunction(),
                        _buildContentHeader(),
                        SizedBox(height: 16.0),
                        ContentOfCourse(
                          course: course,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (courseSnapshot.hasError) {
            return Center(
              child: Text(courseSnapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildItemAuthor() {
    return GestureDetector(
      onTap: () {
        context.push(AuthorDetailScreen(course.instructorId));
      },
      child: Chip(
        label: Text(
          course.instructorName,
          style: context.textTheme.subtitle2,
        ),
        avatar: course == null
            ? const Icon(
                Icons.account_circle,
                size: 24.0,
              )
            : CircleAvatarNetwork(
                size: 32.0,
                networkImageUrl: course.instructorAvatar,
              ),
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            style: StyleConst.textTitle,
          ),
          SizedBox(
            height: 16.0,
          ),
          _buildItemAuthor(),
          SizedBox(
            height: 8.0,
          ),
          _buildRowInfo(),
        ],
      ),
    );
  }

  Widget _buildRowInfo() {
    return Row(
      children: [
        Text(
          course.level,
          style: StyleConst.textSmallWhite60,
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.circle,
          color: Colors.white60,
          size: 2,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          course.updateAt,
          style: StyleConst.textSmallWhite60,
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.circle,
          color: Colors.white60,
          size: 2,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "${course.totalMinutes}m",
          style: StyleConst.textSmallWhite60,
        ),
        SizedBox(
          width: 8.0,
        ),
        _buildRating()
      ],
    );
  }

  Widget _buildRating() {
    return RatingBar(
      initialRating: course.ratedNumber,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 14.0,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(
                course.description,
                style: context.textTheme.subtitle2,
                maxLines: 3,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Container(
              color: context.theme.primaryColor,
              alignment: Alignment.center,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonFunction() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          WidgetButtonIcon("Take a learning check", Icons.check_circle_outline),
          WidgetButtonIcon("View related paths & courses", Icons.view_day),
        ],
      ),
    );
  }

  Widget _buildContentHeader() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "CONTENT",
        style: StyleConst.textMedium,
      ),
    );
  }
}
