import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/common_widgets/widget_my_flat_btn.dart';

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
        backgroundColor: COLOR_CONST.GRAY_DARK,
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
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
            MyFlatButton(
              title: "ALREADY HAVE A ACCOUNT?",
            ),
          ],
        ),
      ),
    );
  }
}
