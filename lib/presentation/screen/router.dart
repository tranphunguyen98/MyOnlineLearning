import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/change_password/sc_change_password.dart';
import 'package:my_online_learning/presentation/screen/Authentication/register/sc_register.dart';
import 'package:my_online_learning/presentation/screen/Authentication/reset_password/sc_reset_password.dart';
import 'package:my_online_learning/presentation/screen/Authentication/start/sc_start.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/category_detail/sc_category_detail.dart';
import 'package:my_online_learning/presentation/screen/home_page.dart';
import 'package:my_online_learning/presentation/screen/others/splash/sc_splash.dart';
import 'package:my_online_learning/presentation/screen/others/subscription/sc_subscription.dart';
import 'package:my_online_learning/presentation/screen/others/view_list_by_location/sc_view_list_by_location.dart';

import 'Authentication/sign_in/sc_sign_in.dart';
import 'account_manager/Account/sc_account.dart';
import 'account_manager/Setting/sc_setting.dart';
import 'account_manager/change_theme/sc_change_themes.dart';
import 'course_study/course_detail/sc_course_detail.dart';

class MyRouter {
  static const String SPLASH = '/splash';
  static const String HOME_PAGE = '/home_page';
  static const String ACCOUNT = '/account';
  static const String SETTING = '/setting';
  static const String THEME = '/theme';
  static const String LIST_COURSE = '/list_course';
  static const String COURSE_DETAIL = '/course_detail';
  static const String START = '/start';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String FORGOT_PASSWORD = '/forgot_password';
  static const String CHANGE_PASSWORD = '/change_password';
  static const String SUBSCRIPTION = '/subscription';
  static const String VIEW_LIST_BY_LOCATION = '/view_list_by_location';
  static const String CATEGORY_DETAIL = '/category_detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case CATEGORY_DETAIL:
        return MaterialPageRoute(builder: (_) => CategoryDetailScreen());
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomePage());
      case ACCOUNT:
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case SETTING:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case THEME:
        return MaterialPageRoute(builder: (_) => ChangeThemeScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      // case LIST_COURSE:
      //   return MaterialPageRoute(builder: (_) => ListCourseScreen());
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
      case SUBSCRIPTION:
        return MaterialPageRoute(builder: (_) => SubscriptionScreen());
      case VIEW_LIST_BY_LOCATION:
        return MaterialPageRoute(builder: (_) => ViewListByLocationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
