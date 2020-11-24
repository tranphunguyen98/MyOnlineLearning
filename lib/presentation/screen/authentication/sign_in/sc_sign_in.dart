import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_flat_btn.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/remote/source/authentication/authentication_service.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

import 'widget_login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void signIn() {}

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
        title: Text("Sign In"),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Consumer<AuthenticationService>(
        builder: (_, repository, __) {
          return SingleChildScrollView(
            child: Container(
              color: context.theme.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.0),
                  WidgetLoginForm(
                      signIn: (String userName, String password) async {
                    _showDiaglogLoading("Sign In");
                    try {
                      final bool isSucceeded =
                          await repository.signIn(userName, password);
                      if (isSucceeded) {
                        Navigator.pop(context);
                        _showMaterialDialog("Sign in Succeeded", "Succeeded");
                      }
                    } catch (e) {
                      Navigator.pop(context);
                      _showMaterialDialog("Sign in failed", e.toString());
                    }
                  }),
                  SizedBox(height: 8.0),
                  FlatButtonCommon(
                    title: "LOGIN WITH GOOGLE",
                    onPressed: () {},
                  ),
                  SizedBox(height: 8.0),
                  FlatButtonCommon(
                    title: "FORGOT PASSWORD?",
                    onPressed: () {
                      context.pushNamed(MyRouter.FORGOT_PASSWORD);
                    },
                  ),
                  FlatButtonCommon(
                    title: "DON'T HAVE A ACCOUNT?",
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, MyRouter.REGISTER);
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

  _showDiaglogLoading(String message) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: context.theme.primaryColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 32.0,
              ),
              Text(
                message + "...",
                style: context.textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showMaterialDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: context.theme.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            var width = MediaQuery.of(context).size.width;
            return Container(
              width: width,
              child: Text(content),
            );
          },
        ),
        title: Text(title),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
