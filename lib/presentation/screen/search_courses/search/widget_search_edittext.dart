import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class WidgetSearchEditText extends StatelessWidget {
  final Function onTap;
  const WidgetSearchEditText({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      color: context.theme.primaryColorDark,
      child: TextField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        style: context.textTheme.subtitle2,
        onChanged: (string) {
          onTap();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          hintText: "Search...",
          hintStyle: context.textTheme.subtitle2,
        ),
      ),
    );
  }
}
