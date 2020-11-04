import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_logo.dart';
import 'package:my_online_learning/utils/extensions.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: context.theme.backgroundColor,
        child: Center(child: WidgetLogo()),
      ),
    );
  }
}
