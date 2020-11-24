import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class DialogLoading extends StatelessWidget {
  final String message;
  const DialogLoading(this.message);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.primaryColor,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 32.0,
            ),
            FittedBox(
              child: Text(
                message + "...",
                style: context.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
