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
        backgroundColor: context.theme.primaryColor,
      ),
      body: Consumer2<IAuthenticationRepository, IUserRepository>(
        builder: (_, authRepo, userRepo, __) {
          return Container(
            color: context.theme.backgroundColor,
            child: ListView(
              children: [
                const SizedBox(height: 16.0),
                WidgetRegisterForm(
                  signUp: (user, password) async {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return DialogLoading("Register");
                        });

                    try {
                      await authRepo.signUp(user, password);
                      Navigator.pop(context);
                      context.pushReplacementNamed(MyRouter.HOME_PAGE);
                      await userRepo.saveUser(user);
                      context.read<UserModel>().user = user;
                    } catch (e) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialogSimple("Register", e.toString());
                        },
                      );
                    }
                  },
                ),
                FlatButtonCommon(
                  title: "ALREADY HAVE A ACCOUNT?",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyRouter.LOGIN);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
