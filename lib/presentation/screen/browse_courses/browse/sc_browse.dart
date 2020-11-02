import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_categories/widget_category_course.dart';

import '../list_of_authors/widget_category_author.dart';

class BrowseScreen extends StatelessWidget {
  final List<DropdownChoices> dropdownChoices = [
    DropdownChoices(title: "Setting"),
    DropdownChoices(title: "Send feedback"),
    DropdownChoices(title: "Contact support"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: COLOR_CONST.GRAY_DARK,
        actions: [
          GestureDetector(
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRouter.ACCOUNT);
            },
          ),
          PopupMenuButton<DropdownChoices>(
            onSelected: (DropdownChoices choice) {
              Navigator.pushNamed(context, MyRouter.SETTING);
            },
            elevation: 6,
            itemBuilder: (BuildContext context) {
              return dropdownChoices.map((DropdownChoices choice) {
                return PopupMenuItem<DropdownChoices>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              WidgetCategoryCourse(title: "New"),
              WidgetCategoryCourse(title: "Trending"),
              WidgetCategoryAuthor(
                title: "Top authors",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownChoices {
  const DropdownChoices({this.title});

  final String title;
}
