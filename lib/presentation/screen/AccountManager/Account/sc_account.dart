import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/COLOR_CONST.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: COLOR_CONST.GRAY_DARK,
      ),
      body: Container(
        color: COLOR_CONST.BACKGROUND_DARK,
        child: Column(
          children: [
            SizedBox(height: 32.0),
            _buildAvatarName(),
            SizedBox(height: 64.0),
            _buildInfoActive(),
          ],
        ),
      ),
    );
  }

  _buildAvatarName() {
    return Column(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/account_circle.png"),
            ),
          ),
        ),
        Text(
          "Tran Phu Nguyen",
          style: STYLE_CONST.textTitle,
        )
      ],
    );
  }
}

_buildItemInfoActive(String title, String data, String extraData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: STYLE_CONST.textRegularGray,
      ),
      SizedBox(
        height: 8.0,
      ),
      Row(
        children: [
          Text(data, style: STYLE_CONST.textMedium),
          SizedBox(
            width: 8.0,
          ),
          Text(extraData, style: STYLE_CONST.textRegularGray),
        ],
      )
    ],
  );
}

_buildInfoActive() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Activity insights (last 30 days",
          style: STYLE_CONST.textMedium,
        ),
        SizedBox(height: 64.0),
        _buildItemInfoActive("TOTAL ACTIVE DAYS", "1", "0 day streak"),
        SizedBox(height: 32.0),
        _buildItemInfoActive("MOST ACTIVE TIME OF DAY", "8:00 PM", ""),
        SizedBox(height: 32.0),
        _buildItemInfoActive("MOST VIEWED SUBJECT", "Angular", ""),
      ],
    ),
  );
}
