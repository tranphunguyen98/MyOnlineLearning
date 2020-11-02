import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_all.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_authors.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_courses.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_paths.dart';

class TabResultSearch extends StatefulWidget {
  @override
  _TabResultSearchState createState() => _TabResultSearchState();
}

class _TabResultSearchState extends State<TabResultSearch> {
  int _selectedIndex = 0;
  final List<TabItemData> tabItems = [
    TabItemData("ALL", TabAll()),
    TabItemData("COURSES", TabCourses()),
    TabItemData("PATHS", TabPath()),
    TabItemData("AUTHORS", TabAuthor()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 4,
          child: _buildTabBar(),
        ),
        Expanded(child: tabItems[_selectedIndex].page),
      ],
    );
  }

  _buildTabBar() {
    return TabBar(
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      tabs: tabItems
          .map((e) => Tab(
                text: e.title,
              ))
          .toList(),
    );
  }
}

class TabItemData {
  final String title;
  final Widget page;

  TabItemData(this.title, this.page);
}
