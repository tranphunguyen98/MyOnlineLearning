import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/Authentication/sign_in/widget_login_form.dart';

class ScreenLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Sign In"),
      ),
      body: WidgetLoginForm(),
    );
  }
}
