import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class MyOutlineButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const MyOutlineButton(this.title, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: context.theme.accentColor),
      onPressed: this.onPressed,
      child: Text(
        this.title,
        style: TextStyle(
          color: context.theme.accentColor,
        ),
      ),
    );
  }
}
