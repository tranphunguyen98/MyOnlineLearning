import 'package:flutter/material.dart';
import 'package:my_online_learning/data/repository/authentication/i_authentication_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_dialog_loading.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/validator.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/widget_my_raised_btn.dart';
import '../../router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Forgot Password"),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Consumer<IAuthenticationRepository>(builder: (_, repository, __) {
          return Container(
            color: context.theme.backgroundColor,
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WidgetTextField(
                    validator: validateEmail,
                    controller: _controller,
                    title: "Email",
                  ),
                  SizedBox(height: 16.0),
                  MyRaisedButton(
                    title: "SEND EMAIL FORGET PASSWORD",
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              DialogLoading("Send email reset password"),
                        );
                        try {
                          await repository
                              .sendEmailResetPassword(_controller.text);
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialogSimple("Reset Password",
                                  "Send email reset password succeed", () {
                                Navigator.pop(context);
                                context.pushReplacementNamed(MyRouter.LOGIN);
                              });
                            },
                          );
                        } catch (e) {
                          _showDialogResetPassword(context, e.toString());
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showDialogResetPassword(BuildContext context, String message) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialogSimple("Reset Password", message);
      },
    );
  }
}
