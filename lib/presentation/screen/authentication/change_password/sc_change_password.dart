import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/authentication/i_authentication_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_dialog_loading.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/validator.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();

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
      body: Consumer<IAuthenticationRepository>(
        builder: (_, repository, __) {
          return Form(
            key: _formKey,
            child: Container(
              color: context.theme.backgroundColor,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WidgetTextField(
                    controller: _controllerPassword,
                    validator: validatePassword,
                    title: "New Password",
                    hasObscure: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  WidgetTextField(
                    controller: _controllerConfirmPassword,
                    validator: (confirmPassword) {
                      return validateConfirmPassword(
                          _controllerPassword.text, confirmPassword);
                    },
                    title: "Confirm New Password",
                    hasObscure: true,
                  ),
                  SizedBox(height: 16.0),
                  MyRaisedButton(
                    title: "CHANGE PASSWORD",
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DialogLoading("Change password");
                            });

                        await repository.createNewPassword("", "");

                        Navigator.pop(context);

                        showDialog(
                          context: context,
                          builder: (_) {
                            return const AlertDialogSimple(
                              "Change password",
                              "Changed password successful",
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
