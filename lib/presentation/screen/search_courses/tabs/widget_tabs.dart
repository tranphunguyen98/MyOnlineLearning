import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_all.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_authors.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/tab_courses.dart';
import 'package:provider/provider.dart';

class TabResultSearch extends StatefulWidget {
  @override
  _TabResultSearchState createState() => _TabResultSearchState();
}

class _TabResultSearchState extends State<TabResultSearch> {
  int _selectedIndex = 0;
  final List<TabItemData> tabItems = [
    TabItemData("ALL", TabAll()),
    TabItemData("COURSES", TabCourses()),
    // TabItemData("PATHS", TabPath()),
    TabItemData("AUTHORS", TabAuthor()),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultModel>(
      builder: (_, searchResult, __) => searchResult.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                DefaultTabController(
                  length: tabItems.length,
                  child: TabBar(
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
                  ),
                ),
                Expanded(child: tabItems[_selectedIndex].page),
              ],
            ),
    );
  }
}

class TabItemData {
  final String title;
  final Widget page;

  TabItemData(this.title, this.page);
}
