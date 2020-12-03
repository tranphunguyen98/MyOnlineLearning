import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/theme_setting.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';
import 'package:provider/provider.dart';

class ChangeThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Themes",
            style: context.textTheme.headline6,
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Consumer<ThemeSetting>(
          builder: (context, themeSetting, child) => Container(
            color: context.theme.backgroundColor,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("System",
                //     style: context.textTheme.subtitle2.copyWith(fontSize: 18.0)),
                // _buildDivider(),
                GestureDetector(
                  onTap: themeSetting.isLightTheme
                      ? null
                      : () {
                          themeSetting.isLightTheme = true;
                        },
                  child: Text(
                    "Light",
                    style: themeSetting.isLightTheme
                        ? context.textTheme.subtitle2.copyWith(
                            fontSize: 18.0,
                            color: context.theme.accentColor,
                          )
                        : context.textTheme.subtitle2.copyWith(fontSize: 18.0),
                  ),
                ),
                _buildDivider(),
                GestureDetector(
                  onTap: !themeSetting.isLightTheme
                      ? null
                      : () {
                          themeSetting.isLightTheme = false;
                        },
                  child: Text(
                    "Dark",
                    style: !themeSetting.isLightTheme
                        ? context.textTheme.subtitle2.copyWith(
                            fontSize: 18.0,
                            color: context.theme.accentColor,
                          )
                        : context.textTheme.subtitle2.copyWith(fontSize: 18.0),
                  ),
                ),
                _buildDivider(),
              ],
            ),
          ),
        ));
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
      child: Divider(
        thickness: 0.5,
        color: Colors.white60,
      ),
    );
  }

  _buildItemSetting(String title, String subtitle, bool hasSwitch) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
