import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final String title;

  const MyRaisedButton({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RaisedButton(
        child: Text(
          this.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => {},
        color: Colors.blue,
      ),
    );
  }
}
