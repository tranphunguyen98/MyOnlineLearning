import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_raised_btn.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';

class WidgetLoginForm extends StatefulWidget {
  final Function(String, String) signIn;

  const WidgetLoginForm({@required this.signIn});

  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  final String kRegexEmail =
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
  final String kRegexPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}\$";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetTextField(
              controller: _userNameController,
              validator: (value) {
                RegExp regExp = RegExp(kRegexEmail);
                // if (!regExp.hasMatch(value)) {
                if (value.length < 4) {
                  return "Invalid email";
                }
                return null;
              },
              title: "Email",
            ),
            SizedBox(
              height: 16,
            ),
            WidgetTextField(
              controller: _passwordController,
              title: "Password",
              hasObscure: true,
              validator: (value) {
                RegExp regExp = RegExp(kRegexPassword);
                // if (!regExp.hasMatch(value)) {
                if (value.length < 4) {
                  return "Invalid password";
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            MyRaisedButton(
                title: "SIGN IN",
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    widget.signIn(
                      _userNameController.text,
                      _passwordController.text,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
