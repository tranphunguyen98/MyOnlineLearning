import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/sc_home.dart';
import 'package:my_online_learning/presentation/screen/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Online Learning',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MyRouter.COURSE_DETAIL,
        onGenerateRoute: MyRouter.generateRoute,
        home: HomeScreen());
  }
}
