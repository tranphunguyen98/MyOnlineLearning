import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/model/entity/path.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/ItemCourseVerticalDivider.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/item_author_divider.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/item_path_divider.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class TabAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderResult("Courses", Course.listCourse.length),
            ...Course.listCourse.map(
              (e) => ItemCourseVerticalDivider(
                course: e,
              ),
            ),
            HeaderResult("Paths", Path.listPath.length),
            ...Path.listPath.map(
              (e) => ItemPathDivider(
                path: e,
              ),
            ),
            HeaderResult("Authors", Author.listAuthor.length),
            ...Author.listAuthor.map(
              (e) => ItemAuthorSearchDivider(
                author: e,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderResult extends StatelessWidget {
  final String title;
  final int numberOfResult;

  const HeaderResult(
    this.title,
    this.numberOfResult, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.subtitle2,
              ),
              Row(
                children: [
                  Text(
                    "$numberOfResult Results",
                    style: StyleConst.textRegularGray,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
          StyleConst.spaceHorizontalRegular,
          Divider(
            color: Colors.white60,
            height: 8,
          )
        ],
      ),
    );
  }
}
