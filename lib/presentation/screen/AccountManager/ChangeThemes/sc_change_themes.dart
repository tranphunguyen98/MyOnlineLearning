import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ChangeThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Themes"),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Container(
          color: context.theme.backgroundColor,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("System", style: StyleConst.textMedium),
              _buildDivider(),
              Text("Light", style: StyleConst.textMedium),
              _buildDivider(),
              Text("Dark", style: StyleConst.textMediumPrimary),
              _buildDivider(),
            ],
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
