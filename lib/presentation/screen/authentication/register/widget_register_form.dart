import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_raised_btn.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';
import 'package:my_online_learning/utils/validator.dart';

class WidgetRegisterForm extends StatefulWidget {
  final Function(User, String) signUp;

  const WidgetRegisterForm({@required this.signUp});

  @override
  _WidgetRegisterFormState createState() => _WidgetRegisterFormState();
}

class _WidgetRegisterFormState extends State<WidgetRegisterForm> {
  final _controllerUserName = TextEditingController();

  final _controllerUserEmail = TextEditingController();

  final _controllerUserFullName = TextEditingController();

  final _controllerUserPassword = TextEditingController();

  final _controllerUserConfirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WidgetTextField(
              validator: validateNameUser,
              controller: _controllerUserName,
              title: "Username",
            ),
            SizedBox(height: 16),
            WidgetTextField(
              validator: validateEmail,
              controller: _controllerUserEmail,
              title: "Email",
            ),
            SizedBox(height: 16),
            WidgetTextField(
              validator: validateFullName,
              controller: _controllerUserFullName,
              title: "Full Name",
            ),
            SizedBox(height: 16),
            WidgetTextField(
              validator: validatePassword,
              controller: _controllerUserPassword,
              title: "Password",
              hasObscure: true,
            ),
            SizedBox(height: 16),
            WidgetTextField(
              validator: (confirmPassword) {
                return validateConfirmPassword(
                  _controllerUserPassword.text,
                  confirmPassword,
                );
              },
              controller: _controllerUserConfirmPassword,
              title: "Confirm Password",
              hasObscure: true,
            ),
            const SizedBox(height: 16.0),
            MyRaisedButton(
              title: "REGISTER",
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final user = User(
                    userName: _controllerUserName.text,
                    fullName: _controllerUserFullName.text,
                    email: _controllerUserEmail.text,
                  );
                  widget.signUp(user, _controllerUserPassword.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
