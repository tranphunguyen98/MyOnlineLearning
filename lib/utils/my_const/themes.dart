import 'package:flutter/material.dart';

enum AppThemeKeys { light, dark }

final Map<AppThemeKeys, ThemeData> _themes = {
  AppThemeKeys.light: ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.blue,
      brightness: Brightness.light,
      backgroundColor: Colors.white),
  AppThemeKeys.dark: ThemeData(
      primaryColor: const Color(0xff20252B),
      primaryColorDark: const Color(0xff181b20),
      accentColor: const Color(0xff2196f3),
      brightness: Brightness.dark,
      backgroundColor: const Color(0xff121212),
      textTheme: const TextTheme()),
};
