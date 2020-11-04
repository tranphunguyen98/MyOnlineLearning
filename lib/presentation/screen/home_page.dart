import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/browse/sc_browse.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/download/sc_download.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/sc_home.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/sc_search.dart';
import 'package:my_online_learning/utils/extensions.dart';

import 'router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<DropdownChoices> dropdownChoices = [
    DropdownChoices(title: "Setting"),
    DropdownChoices(title: "Send feedback"),
    DropdownChoices(title: "Contact support"),
  ];

  final List<BottomNavigationData> bottomNavigationItems = [
    BottomNavigationData("Home", Icons.home, 0xff181b20, HomeScreen()),
    BottomNavigationData(
        "Downloads", Icons.get_app, 0xff181b20, DownloadScreen()),
    BottomNavigationData("Browse", Icons.language, 0xff181b20, BrowseScreen()),
    BottomNavigationData("Search", Icons.search, 0xff181b20, SearchScreen(),
        hasAppBar: false),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: bottomNavigationItems[_selectedIndex].hasAppBar
            ? AppBar(
                title: Text(
                  bottomNavigationItems[_selectedIndex].title,
                  style: context.textTheme.subtitle2,
                ),
                actions: [
                  GestureDetector(
                    child: Icon(
                      Icons.account_circle,
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
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationItems
              .map((bottomNavigationData) => BottomNavigationBarItem(
                    icon: Icon(
                      bottomNavigationData.iconData,
                    ),
                    label: bottomNavigationData.title,
                    backgroundColor: context.theme.primaryColor,
                  ))
              .toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: context.theme.accentColor,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
        body: bottomNavigationItems[_selectedIndex].destination);
  }
}

class BottomNavigationData {
  final String title;
  final IconData iconData;
  final int color;
  final Widget destination;
  final bool hasAppBar;

  const BottomNavigationData(
      this.title, this.iconData, this.color, this.destination,
      {this.hasAppBar = true});
}

class DropdownChoices {
  const DropdownChoices({this.title});

  final String title;
}
