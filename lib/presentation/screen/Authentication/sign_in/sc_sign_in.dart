import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/sign_in/widget_login_form.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/common_widgets/widget_my_flat_btn.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';

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
        backgroundColor: COLOR_CONST.GRAY_DARK,
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
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
            MyFlatButton(
              title: "FORGOT PASSWORD?",
            ),
            MyFlatButton(
              title: "DON'T HAVE A ACCOUNT?",
            ),
          ],
        ),
      ),
    );
  }
}
