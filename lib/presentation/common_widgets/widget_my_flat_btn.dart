import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class FlatButtonCommon extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const FlatButtonCommon({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: context.theme.accentColor,
          ),
        ),
      ),
    );
  }
}
