import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/browse/sc_browse.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/sc_home.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/sc_search.dart';
import 'package:my_online_learning/utils/my_const/COLOR_CONST.dart';

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
    BottomNavigationData("Downloads", Icons.get_app, 0xff181b20, HomeScreen()),
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
        appBar: _buildAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationItems
              .map((e) => BottomNavigationBarItem(
                    icon: Icon(e.iconData),
                    label: e.title,
                    backgroundColor: Color(e.color),
                  ))
              .toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: COLOR_CONST.BTN_DEFAULT,
          onTap: _onItemTapped,
        ),
        body: bottomNavigationItems[_selectedIndex].destination);
  }

  _buildAppBar() {
    return bottomNavigationItems[_selectedIndex].hasAppBar
        ? AppBar(
            title: Text(bottomNavigationItems[_selectedIndex].title),
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
          )
        : null;
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
