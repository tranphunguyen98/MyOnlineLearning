import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/sign_in/sc_sign_in.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/sc_home.dart';
import 'package:my_online_learning/utils/my_const/COLOR_CONST.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> listDestination = [
    HomeScreen(),
    LoginScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xff181b20),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.get_app),
              label: 'Downloads',
              backgroundColor: Color(0xff181b20),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'Browse',
              backgroundColor: Color(0xff181b20),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Color(0xff181b20),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: COLOR_CONST.BTN_DEFAULT,
          onTap: _onItemTapped,
        ),
        body: listDestination[_selectedIndex]);
  }
}
