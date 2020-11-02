import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_item_large.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_categories/widget_category_item_medium.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';

import '../list_of_authors/widget_category_author.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.BACKGROUND_DARK,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildListCategoryLarge(),
              _buildListCategoryMedium(),
              _buildListSkill(),
              WidgetCategoryCourse(title: "New"),
              WidgetCategoryCourse(title: "Trending"),
              WidgetCategoryAuthor(title: "Top authors"),
            ],
          ),
        ),
      ),
    );
  }

  _buildListCategoryLarge() {
    return Column(
      children: [
        CategoryItemLarge(
            "NEW\nRELEASES", "images/background_category_large.png"),
        SizedBox(height: 16.0),
        CategoryItemLarge(
            "RECOMMENDED\nFOR YOU", "images/background_category_large.png"),
      ],
    );
  }

  _buildListSkill() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32.0,
        ),
        Text(
          "Popular Skills",
          style: STYLE_CONST.textRegular,
        ),
        SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: 40.0,
          child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(
                      backgroundColor: COLOR_CONST.GRAY_LIGHT,
                      label: Text(
                        "Angular",
                        style: STYLE_CONST.textRegular,
                      )),
                );
              }),
        ),
      ],
    );
  }

  _buildListCategoryMedium() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 30.0,
          maxHeight: 160.0,
        ),
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.6,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CategoryItemMedium("  SOFTWARE\nDEVELOPMENT",
                "images/background_category_large.png");
          },
        ),
      ),
    );
  }
}
