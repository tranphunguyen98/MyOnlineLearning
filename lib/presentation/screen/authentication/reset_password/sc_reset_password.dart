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

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool sentVerificationCode = false;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        title:
            Text(sentVerificationCode ? "Confirm OTP Code" : "Forgot Password"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Consumer<IAuthenticationRepository>(builder: (_, repository, __) {
        return Container(
          color: context.theme.backgroundColor,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      WidgetTextField(
                        validator:
                            sentVerificationCode ? validateOTP : validateEmail,
                        controller: _controller,
                        title: sentVerificationCode ? "OTP Code" : "Email",
                      ),
                      SizedBox(height: 16.0),
                      MyRaisedButton(
                        title: sentVerificationCode
                            ? "CONFIRM OTP CODE"
                            : "SEND VERIFICATION CODE",
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (sentVerificationCode) {
                              showDialog(
                                context: context,
                                builder: (_) =>
                                    DialogLoading("Confirm verification code"),
                              );

                              try {
                                final bool isSucceed = await repository
                                    .confirmOTPCode(_controller.text);
                                Navigator.pop(context);
                                if (isSucceed) {
                                  context.pushReplacementNamed(
                                      MyRouter.CHANGE_PASSWORD);
                                }
                              } catch (e) {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialogSimple(
                                    "Confirm OTP",
                                    e.toString(),
                                  ),
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (_) =>
                                    DialogLoading("Send OTP to email"),
                              );
                              await repository
                                  .sendOTPCodeToEmail(_controller.text);
                              _controller.text = "";
                              Navigator.pop(context);
                              setState(() {
                                sentVerificationCode = true;
                              });
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );

    void _sendOTPCodeToEmail() {}
  }
}
