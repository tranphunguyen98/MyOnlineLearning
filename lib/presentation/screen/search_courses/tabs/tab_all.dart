import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/item_author_divider.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/item_course_vertical_divider.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:provider/provider.dart';

class TabAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultModel>(
      builder: (_, searchResult, __) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderResult("Courses", searchResult.data.listCourse.length),
              ...searchResult.data.listCourse.map(
                (e) => ItemCourseVerticalDivider(
                  course: e,
                ),
              ),
              // HeaderResult("Paths", Path.listPath.length),
              // ...Path.listPath.map(
              //   (e) => ItemPathDivider(
              //     path: e,
              //   ),
              // ),
              HeaderResult("Authors", searchResult.data.listAuthor.length),
              ...searchResult.data.listAuthor.map(
                (e) => ItemAuthorSearchDivider(
                  author: e,
                ),
              ),
            ],
          ),
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
