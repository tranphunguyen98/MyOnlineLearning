import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_list_courses_h.dart';

class WidgetCategoryCourse extends StatelessWidget {
  final String title;
  final List<Course> listCourse;
  const WidgetCategoryCourse({@required this.title, this.listCourse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          title: title,
        ),
        ListCourseHorizontal(listCourse),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.subtitle2,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: WidgetSeeAll(),
          )
        ],
      ),
    );
  }
}

class WidgetSeeAll extends StatelessWidget {
  const WidgetSeeAll({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(MyRouter.LIST_COURSE),
      child: Row(
        children: [
          Text(
            "See all",
            style: StyleConst.textSmallWhite60,
          ),
          Icon(
            Icons.navigate_next,
            size: 16,
            color: Colors.white60,
          )
        ],
      ),
    );
  }
}
