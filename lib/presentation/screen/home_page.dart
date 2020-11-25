import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/browse/sc_browse.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/download/sc_download.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/sc_home.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/sc_search.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

import 'router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<DropdownChoices> dropdownChoices = [
    DropdownChoices(
        title: "Setting",
        onPressed: (context) {
          Navigator.pushNamed(context, MyRouter.SETTING);
        }),
    DropdownChoices(title: "Send feedback", onPressed: (context) {}),
    DropdownChoices(title: "Contact support", onPressed: (context) {}),
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
            ? _buildAppBar()
            : null,
        bottomNavigationBar: BottomNavigationBar(
          items: _buildBottomNavigationBarItems(),
          currentIndex: _selectedIndex,
          selectedItemColor: context.theme.accentColor,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
        body: bottomNavigationItems[_selectedIndex].destination);
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return bottomNavigationItems
        .map(
          (bottomNavigationData) => BottomNavigationBarItem(
            icon: Icon(
              bottomNavigationData.iconData,
            ),
            label: bottomNavigationData.title,
            backgroundColor: context.theme.primaryColor,
          ),
        )
        .toList();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        bottomNavigationItems[_selectedIndex].title,
        style: context.textTheme.subtitle2,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyRouter.ACCOUNT);
          },
          child: Selector<UserModel, String>(
              selector: (_, userModel) => userModel?.user?.urlImage,
              builder: (_, urlImage, __) {
                return urlImage != null
                    ? CircleAvatarNormal(
                        assetImageUrl: urlImage,
                        size: 32.0,
                      )
                    : Icon(
                        Icons.account_circle,
                        size: 32.0,
                        color: Colors.blue,
                      );
              }),
        ),
        PopupMenuButton<DropdownChoices>(
          onSelected: (DropdownChoices choice) {
            choice.onPressed(context);
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
    );
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
  const DropdownChoices({
    @required this.title,
    @required this.onPressed,
  });

  final String title;
  final Function(BuildContext context) onPressed;
}
