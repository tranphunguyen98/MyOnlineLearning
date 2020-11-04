import 'package:flutter/material.dart';

class SettingsStore extends InheritedWidget {
  final ValueNotifier<ThemeData> theme = ValueNotifier(ThemeData.light());

  SettingsStore({@required Widget child}) : super(child: child);

  static SettingsStore of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsStore>();

  // ignore: use_setters_to_change_properties
  void updateTheme(ThemeData theme) => this.theme.value = theme;

  @override
  bool updateShouldNotify(SettingsStore oldWidget) => oldWidget.theme != theme;
}
