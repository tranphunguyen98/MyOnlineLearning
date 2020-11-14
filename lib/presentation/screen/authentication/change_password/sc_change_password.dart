import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';
import 'widget_change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
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
        title: Text("Change Password"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            WidgetChangePasswordForm(),
            SizedBox(height: 16.0),
            MyRaisedButton(
              title: "CHANGE PASSWORD",
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
