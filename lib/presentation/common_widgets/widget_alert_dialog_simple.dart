import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class AlertDialogSimple extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressedOK;

  const AlertDialogSimple(this.title, this.content, [this.onPressedOK]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          var width = MediaQuery.of(context).size.width;
          return Container(
            width: width,
            child: Text(content),
          );
        },
      ),
      title: Text(title),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'OK',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: onPressedOK ??
              () {
                Navigator.of(context).pop();
              },
        ),
      ],
    );
  }
}
