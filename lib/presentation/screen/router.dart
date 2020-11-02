import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/AccountManager/Account/sc_account.dart';
import 'package:my_online_learning/presentation/screen/AccountManager/ChangeThemes/sc_change_themes.dart';
import 'package:my_online_learning/presentation/screen/AccountManager/Setting/sc_setting.dart';
import 'package:my_online_learning/presentation/screen/Authentication/change_password/sc_change_password.dart';
import 'package:my_online_learning/presentation/screen/Authentication/register/sc_register.dart';
import 'package:my_online_learning/presentation/screen/Authentication/reset_password/sc_reset_password.dart';
import 'package:my_online_learning/presentation/screen/Authentication/start/sc_start.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/browse/sc_browse.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_courses/sc_list_course.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_introduction/sc_course_introduction.dart';
import 'package:my_online_learning/presentation/screen/home_page.dart';

import 'Authentication/sign_in/sc_sign_in.dart';
import 'browse_courses/home/sc_home.dart';

class MyRouter {
  static const String HOME_PAGE = '/home_page';
  static const String ACCOUNT = '/account';
  static const String SETTING = '/setting';
  static const String THEME = '/theme';
  static const String HOME = '/home';
  static const String BROWSE = '/browse';
  static const String LIST_COURSE = '/list_course';
  static const String COURSE_DETAIL = '/course_detail';
  static const String START = '/start';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String FORGOT_PASSWORD = '/forgot_password';
  static const String CHANGE_PASSWORD = '/change_password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ACCOUNT:
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case SETTING:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case BROWSE:
        return MaterialPageRoute(builder: (_) => BrowseScreen());
      case THEME:
        return MaterialPageRoute(builder: (_) => ChangeThemeScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case LIST_COURSE:
        return MaterialPageRoute(builder: (_) => ListCourseScreen());
      case COURSE_DETAIL:
        return MaterialPageRoute(builder: (_) => CourseDetailScreen());
      case START:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case FORGOT_PASSWORD:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case CHANGE_PASSWORD:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
