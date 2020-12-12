import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class CircleOutlineButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const CircleOutlineButton(this.title, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(color: context.theme.accentColor),
      ),
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
