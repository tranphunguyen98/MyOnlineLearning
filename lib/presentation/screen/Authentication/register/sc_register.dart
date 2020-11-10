import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_flat_btn.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/extensions.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';
import 'widget_register_form.dart';

class RegisterScreen extends StatelessWidget {
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
        title: Text("Register"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        child: ListView(
          children: [
            SizedBox(height: 16.0),
            WidgetRegisterForm(),
            SizedBox(height: 16.0),
            MyRaisedButton(
              title: "REGISTER",
              onPressed: () => {},
            ),
            SizedBox(height: 8.0),
            FlatButtonCommon(
              title: "ALREADY HAVE A ACCOUNT?",
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyRouter.LOGIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
