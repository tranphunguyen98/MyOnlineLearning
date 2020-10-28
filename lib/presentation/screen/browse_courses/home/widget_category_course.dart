import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/widget_list_courses_h.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class WidgetCategoryCourse extends StatelessWidget {
  final String title;

  const WidgetCategoryCourse({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        ListCourseHorizontal(),
      ],
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: STYLE_CONST.textRegular,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Text(
                  "See all",
                  style: STYLE_CONST.textSmallWhite60,
                ),
                Icon(
                  Icons.navigate_next,
                  size: 16,
                  color: Colors.white60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
