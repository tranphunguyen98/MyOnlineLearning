import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/COLOR_CONST.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ChangeThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Themes"),
          backgroundColor: COLOR_CONST.GRAY_DARK,
        ),
        body: Container(
          color: COLOR_CONST.BACKGROUND_DARK,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("System", style: STYLE_CONST.textMedium),
              _buildDivider(),
              Text("Light", style: STYLE_CONST.textMedium),
              _buildDivider(),
              Text("Dark", style: STYLE_CONST.textMediumPrimary),
              _buildDivider(),
            ],
          ),
        ));
  }

  _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
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
