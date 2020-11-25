import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/authentication/i_authentication_repository.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_dialog_loading.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_flat_btn.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
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
      body: Consumer2<IAuthenticationRepository, IUserRepository>(
        builder: (_, authRepo, userRepo, __) {
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
                      final user = await authRepo.signIn(userName, password);
                      if (user != null) {
                        await userRepo.saveUser(user);
                        context.read<UserModel>().user = user;
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, MyRouter.HOME_PAGE, (router) => false);
                      }
                    } catch (e) {
                      Navigator.pop(context);
                      _showMaterialDialog("Sign in failed", e.toString());
                    }
                  }),
                  SizedBox(height: 8.0),
                  FlatButtonCommon(
                    title: "LOGIN WITH GOOGLE",
                    onPressed: () async {
                      _showDiaglogLoading("Sign In With Google");
                      try {
                        final bool isSucceeded =
                            await authRepo.signInWithGoogle();
                        if (isSucceeded) {
                          Navigator.pop(context);
                          _showMaterialDialog("Sign in Succeeded", "Succeeded");
                        }
                      } catch (e) {
                        Navigator.pop(context);
                        _showMaterialDialog("Sign in failed", e.toString());
                      }
                    },
                  ),
                  SizedBox(height: 8.0),
                  FlatButtonCommon(
                    title: "FORGOT PASSWORD?",
                    onPressed: () {
                      context.pushReplacementNamed(MyRouter.FORGOT_PASSWORD);
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
    showDialog(context: context, builder: (_) => DialogLoading(message));
  }

  _showMaterialDialog(String title, String content) {
    showDialog(
        context: context, builder: (_) => AlertDialogSimple(title, content));
  }
}
