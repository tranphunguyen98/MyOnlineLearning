import 'package:flutter/material.dart';

import 'app_localizations.dart';

extension XBuildContext on BuildContext {
  String translate(String key) => AppLocalizations.of(this).translate(key);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  void pushNamed(String routeName) => Navigator.pushNamed(this, routeName);
}
