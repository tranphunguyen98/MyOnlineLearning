import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class ItemFunctionDetail extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onItemPressed;

  const ItemFunctionDetail(this.title, this.iconData, this.onItemPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        onPressed: onItemPressed != null
            ? () {
                print("adadadadada");
                onItemPressed();
              }
            : null,
        child: Column(
          children: [
            CircleAvatar(
//              backgroundColor: COLOR_CONST.GRAY_LIGHT,
              child: Icon(iconData),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: context.textTheme.subtitle2,
            ),
          ],
        ));
  }
}
