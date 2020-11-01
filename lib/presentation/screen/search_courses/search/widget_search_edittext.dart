import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class WidgetSearchEditText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      color: COLOR_CONST.GRAY_DARK,
      child: TextField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        style: STYLE_CONST.textRegular,
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: STYLE_CONST.textRegular,
        ),
      ),
    );
  }
}
