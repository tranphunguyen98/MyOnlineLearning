import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/change_password/sc_change_password.dart';
import 'package:my_online_learning/presentation/screen/Authentication/register/sc_register.dart';
import 'package:my_online_learning/presentation/screen/Authentication/reset_password/sc_reset_password.dart';
import 'package:my_online_learning/presentation/screen/Authentication/start/sc_start.dart';

import 'Authentication/sign_in/sc_sign_in.dart';

class MyRouter {
  static const String HOME = '/home';
  static const String START = '/start';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String FORGOT_PASSWORD = '/forgot_password';
  static const String CHANGE_PASSWORD = '/change_password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
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
