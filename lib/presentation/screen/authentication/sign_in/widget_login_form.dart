import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_raised_btn.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';
import 'package:my_online_learning/utils/validator.dart';

class WidgetLoginForm extends StatefulWidget {
  final Function(String, String) signIn;

  const WidgetLoginForm({@required this.signIn});

  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
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
              validator: validateEmail,
              title: "Email",
            ),
            SizedBox(
              height: 16,
            ),
            WidgetTextField(
              controller: _passwordController,
              title: "Password",
              hasObscure: true,
              validator: validatePassword,
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
