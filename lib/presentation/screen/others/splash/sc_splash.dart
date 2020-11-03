import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_logo.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Center(child: WidgetLogo()),
      ),
    );
  }
}
