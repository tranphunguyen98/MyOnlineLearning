import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class WidgetButtonIcon extends StatelessWidget {
  final String title;
  final IconData iconData;

  const WidgetButtonIcon(this.title, this.iconData);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: context.theme.primaryColor,
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
            style: context.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
