import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/category.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/sc_list_course.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:provider/provider.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_list_courses_h.dart';

class WidgetCategoryCourse extends StatelessWidget {
  const WidgetCategoryCourse();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        ListCourseHorizontal(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Consumer<Category>(
        builder: (_, category, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category.title,
              style: context.textTheme.subtitle2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: WidgetSeeAll(
                category: category,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetSeeAll extends StatelessWidget {
  final Category category;

  const WidgetSeeAll({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(ListCourseScreen(category)),
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
