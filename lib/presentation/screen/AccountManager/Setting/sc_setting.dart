import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/COLOR_CONST.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
          backgroundColor: COLOR_CONST.GRAY_DARK,
        ),
        body: Container(
          color: COLOR_CONST.BACKGROUND_DARK,
          child: ListView(
            children: [
              SizedBox(height: 16.0,),
              _buildItemSetting("Account", "", false),
              _buildItemSetting(
                  "Subscription", "Free (Limited Library) (Free)", false),
              _buildItemSetting("Communication Preferences", "", false),
              _buildDivider(),
              _buildItemSetting("Language", "English", false),
              _buildItemSetting("Require Wi-fi for streaming", "", true),
              _buildItemSetting("Require Wi-fi for downloading", "", true),
              _buildDivider(),
              _buildItemSetting("Theme", "dark", false),
              _buildDivider(),
              _buildItemSetting("App version", "1.0.0", false),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutlineButton(
                    textColor: COLOR_CONST.BTN_DEFAULT,
                    child: Text(
                      "SIGN OUT",
                    ),
                    borderSide: BorderSide(color: COLOR_CONST.BTN_DEFAULT),
                    onPressed: () {}),
              )
            ],
          ),
        ));
  }

  _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
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
                Text(
                  title,
                  style: STYLE_CONST.textMedium,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  subtitle,
                  style: STYLE_CONST.textRegularGray,
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
