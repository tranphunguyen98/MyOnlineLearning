import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class MyOutlineButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const MyOutlineButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlineButton(
        color: COLOR_CONST.BTN_DEFAULT,
        borderSide: BorderSide(color: COLOR_CONST.BTN_DEFAULT),
        onPressed: this.onPressed,
        child: Text(
          this.title,
          style: TextStyle(
            color: COLOR_CONST.BTN_DEFAULT,
          ),
        ),
      ),
    );
  }
}
