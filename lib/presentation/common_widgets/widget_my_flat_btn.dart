import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class MyFlatButton extends StatelessWidget {
  final String title;

  const MyFlatButton({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FlatButton(
        onPressed: () => {},
        child: Text(
          this.title,
          style: TextStyle(
            color: COLOR_CONST.PRIMARY,
          ),
        ),
      ),
    );
  }
}
