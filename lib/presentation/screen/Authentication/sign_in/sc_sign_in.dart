import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_flat_btn.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/extensions.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';
import 'widget_login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Sign In"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            WidgetLoginForm(),
            SizedBox(height: 16.0),
            MyRaisedButton(
              title: "SIGN IN",
              onPressed: () => {},
            ),
            SizedBox(height: 8.0),
            FlatButtonCommon(
              title: "FORGOT PASSWORD?",
              onPressed: () {
                context.pushNamed(MyRouter.FORGOT_PASSWORD);
              },
            ),
            FlatButtonCommon(
              title: "DON'T HAVE A ACCOUNT?",
            ),
          ],
        ),
      ),
    );
  }
}
