import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/reset_password/widget_forgot_password_form.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
        title: Text("Forgot Password"),
        backgroundColor: COLOR_CONST.GRAY_DARK,
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            WidgetForgotPasswordForm(),
            SizedBox(height: 16.0),
            MyRaisedButton(
              title: "SEND VERIFICATION CODE",
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
