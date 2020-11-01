import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class WidgetButtonIcon extends StatelessWidget {
  final String title;
  final IconData iconData;

  const WidgetButtonIcon(this.title, this.iconData);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: COLOR_CONST.GRAY_LIGHT,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: STYLE_CONST.textRegular,
          ),
        ],
      ),
    );
  }
}
