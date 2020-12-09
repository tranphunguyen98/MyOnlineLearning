import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/utils/extensions.dart';

class WidgetColumnInfoCourse extends StatelessWidget {
  final Course course;

  const WidgetColumnInfoCourse({this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.title,
          style: context.textTheme.subtitle2,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          course.instructorName,
          style: context.textTheme.caption,
        ),
        SizedBox(
          height: 4.0,
        ),
        RowInfo(course: course),
        SizedBox(
          height: 4.0,
        ),
        Rating(course: course),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key key,
    @required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: true,
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
}

class RowInfo extends StatelessWidget {
  const RowInfo({
    Key key,
    @required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          course.level,
          style: context.textTheme.caption,
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
          style: context.textTheme.caption,
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
          style: context.textTheme.caption,
        ),
      ],
    );
  }
}
