import 'package:flutter/cupertino.dart';

class ThemeSetting extends ChangeNotifier {
  bool _isLightTheme = true;

  set isLightTheme(bool isLightTheme) {
    _isLightTheme = isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}
