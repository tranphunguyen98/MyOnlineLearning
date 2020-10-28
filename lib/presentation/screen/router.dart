import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/register/sc_register.dart';
import 'package:my_online_learning/presentation/screen/Authentication/sign_in/sc_sign_in.dart';
import 'package:my_online_learning/presentation/screen/Authentication/start/sc_start.dart';

class MyRouter {
  static const String HOME = '/home';
  static const String START = '/start';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case START:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case REGISTER:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
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
