import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_alert_dialog_simple.dart';
import 'package:my_online_learning/presentation/screen/authentication/start/sc_start.dart';
import 'package:my_online_learning/presentation/screen/home_page.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  IUserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    _userRepository = Provider.of<IUserRepository>(context, listen: false);
    return FutureBuilder<User>(
      future: _userRepository
          .getUser()
          .then((value) => context.read<UserModel>().user = value),
      builder: (_, snapUser) {
        if (snapUser.hasData) {
          print(snapUser.hasData.toString());
          if (snapUser.data.isEmpty()) {
            return StartScreen();
          } else {
            return HomePage();
          }
        } else if (snapUser.hasError) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialogSimple(
                    "Failed to get User", snapUser.error.toString());
              });
          return Container(
            color: context.theme.primaryColor,
          );
        } else {
          return Container(
            color: context.theme.primaryColor,
            child: Center(child: const CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
