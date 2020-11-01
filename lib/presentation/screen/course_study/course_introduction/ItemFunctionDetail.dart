import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ItemFunctionDetail extends StatelessWidget {
  final String title;
  final IconData iconData;

  const ItemFunctionDetail(this.title, this.iconData);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        onPressed: () {},
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: COLOR_CONST.GRAY_LIGHT,
              child: Icon(iconData),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: STYLE_CONST.textRegular,
            ),
          ],
        ));
  }
}
