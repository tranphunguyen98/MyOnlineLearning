import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/Chapter.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'WidgetButtonIcon.dart';
import 'content_of_course.dart';
import 'item_function_detail.dart';

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
                    course: course,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildHeaderInfo(),
                        _buildRowFunction(),
                        _buildDescription(),
                        _buildButtonFunction(),
                        _buildContentHeader(),
                        SizedBox(height: 16.0),
                        ContentOfCourse(),
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
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }

  Widget _buildItemAuthor() {
    return Chip(
        label: Text(
          course.instructorName,
          //TODO style: context.textTheme.subtitle2,
        ),
        avatar: CircleAvatarNormal(
          size: 32.0,
          assetImageUrl: course.instructorAvatar,
        ));
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
          course.createdAt,
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

  Widget _buildRowFunction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemFunctionDetail("Bookmark", Icons.bookmark),
          ItemFunctionDetail("Add to channel", Icons.control_point),
          ItemFunctionDetail("Download", Icons.download_rounded),
        ],
      ),
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
                //TODO style: context.textTheme.subtitle2,
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

class VideoView extends StatelessWidget {
  const VideoView({
    Key key,
    @required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            height: 240,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            image: AssetImage(course.imageUrl)),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Image(
              height: 80,
              width: 80,
              image: AssetImage("assets/ic_play.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemChapter extends StatelessWidget {
  final Chapter chapter;

  const ItemChapter(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(chapter: chapter),
        SizedBox(
          height: 16.0,
        ),
        ...chapter.listLesson.map((lesson) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.stop_circle,
                    color: lesson.isStudying
                        ? Colors.green
                        : context.theme.primaryColorDark,
                    size: 12,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: Text(
                    lesson.title,
                    style: context.textTheme.subtitle2,
                  )),
                  Text(
                    lesson.durationString,
                    style: StyleConst.textRegularGray,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.chapter,
  }) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 60.0,
      child: Row(children: [
        Container(
          width: 60.0,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: context.theme.primaryColorDark,
                  child: Text(
                    chapter.index.toString(),
                    style: context.textTheme.subtitle2,
                  ),
                ),
              ),
              Container(
                height: 4.0,
                color: chapter.isStudying
                    ? Colors.green
                    : context.theme.primaryColorLight,
              )
            ],
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter.title,
                //TODO style: context.textTheme.subtitle2,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                chapter.durationString,
                style: StyleConst.textRegularGray,
              )
            ],
          ),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        )
      ]),
    );
  }
}
