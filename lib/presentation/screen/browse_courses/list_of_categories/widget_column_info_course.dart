import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

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
          style: STYLE_CONST.textRegular,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          course.instructorNames[0],
          style: STYLE_CONST.textSmallWhite60,
        ),
        SizedBox(
          height: 4.0,
        ),
        _buildRowInfo(),
        SizedBox(
          height: 4.0,
        ),
        _buildRating(),
      ],
    );
  }

  _buildRowInfo() {
    return Row(
      children: [
        Text(
          course.level,
          style: STYLE_CONST.textSmallWhite60,
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
          style: STYLE_CONST.textSmallWhite60,
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
          style: STYLE_CONST.textSmallWhite60,
        ),
      ],
    );
  }

  _buildRating() {
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
}
