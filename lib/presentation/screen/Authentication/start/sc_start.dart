import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_logo.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_outline_btn.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WidgetLogo(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyRaisedButton(
                    title: "SIGN IN",
                    onPressed: () =>
                        {Navigator.pushNamed(context, MyRouter.LOGIN)},),
                SizedBox(height: 8.0),
                MyOutlineButton(title: "Register now", onPressed: () => {
                  Navigator.pushNamed(context, MyRouter.REGISTER)
                },),
                SizedBox(height: 8.0),
                MyOutlineButton(
                  title: "Explore without sign in",
                  onPressed: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
