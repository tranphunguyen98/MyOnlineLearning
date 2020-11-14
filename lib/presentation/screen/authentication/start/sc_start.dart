import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_logo.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_outline_btn.dart';
import 'package:my_online_learning/utils/extensions.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';
import '../../router.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.theme.backgroundColor,
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
                      {Navigator.pushNamed(context, MyRouter.LOGIN)},
                ),
                SizedBox(height: 8.0),
                MyOutlineButton(
                  "Register now",
                  onPressed: () =>
                      {Navigator.pushNamed(context, MyRouter.REGISTER)},
                ),
                SizedBox(height: 8.0),
                MyOutlineButton(
                  "Explore without sign in",
                  onPressed: () => {context.pushNamed(MyRouter.HOME_PAGE)},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
