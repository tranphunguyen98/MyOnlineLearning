import 'package:flutter/material.dart';

import 'app_localizations.dart';

extension XBuildContext on BuildContext {
  String translate(String key) => AppLocalizations.of(this).translate(key);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  void pushNamed(String routeName) => Navigator.pushNamed(this, routeName);

  void pushReplacementNamed(String routeName) =>
      Navigator.pushReplacementNamed(this, routeName);

  void pushNamedAndRemoveUntil(String routeName) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, (router) => false);
  void push(Widget widget) => Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
}
