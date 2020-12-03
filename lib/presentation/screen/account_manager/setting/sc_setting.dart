import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/theme_setting.dart';
import 'package:my_online_learning/data/model/user.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/user/i_user_repository.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_my_outline_btn.dart';
import 'package:my_online_learning/presentation/screen/router.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: context.textTheme.headline6,
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Consumer3<UserModel, IUserRepository, ThemeSetting>(
        builder: (_, userModel, userRepo, themeSetting, __) {
          return Container(
            color: context.theme.backgroundColor,
            child: ListView(
              children: [
                SizedBox(
                  height: 16.0,
                ),
                ItemSetting("Account", "", false),
                ItemSetting(
                    "Subscription", "Free (Limited Library) (Free)", false),
                ItemSetting("Communication Preferences", "", false),
                DividerCommon(),
                ItemSetting("Language", "English", false),
                ItemSetting("Require Wi-fi for streaming", "", true),
                ItemSetting("Require Wi-fi for downloading", "", true),
                DividerCommon(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRouter.THEME);
                  },
                  child: ItemSetting("Theme",
                      themeSetting.isLightTheme ? "Light" : "Dark", false),
                ),
                DividerCommon(),
                ItemSetting("App version", "1.0.0", false),
                DividerCommon(),
                if (!userModel.user.isEmpty())
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MyOutlineButton(
                      "SIGN OUT",
                      onPressed: () async {
                        await userRepo.removeUser();
                        userModel.user = User.empty();
                        context.pushNamedAndRemoveUntil(MyRouter.START);
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DividerCommon extends StatelessWidget {
  final double left, right;

  const DividerCommon({
    Key key,
    this.left = 0.0,
    this.right = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: const Divider(
        thickness: 0.5,
        color: Colors.white60,
      ),
    );
  }
}

class ItemSetting extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool hasSwitch;

  const ItemSetting(this.title, this.subtitle, this.hasSwitch);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.subtitle2,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  subtitle,
                  style: StyleConst.textRegularGray,
                )
              ],
            ),
            hasSwitch
                ? Switch(value: true, onChanged: (bool value) => {})
                : SizedBox(),
          ],
        ));
  }
}
