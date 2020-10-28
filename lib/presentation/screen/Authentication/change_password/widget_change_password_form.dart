import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';

class WidgetChangePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          WidgetTextField(
            title: "New Password",
            isObscure: true,
          ),
          SizedBox(
            height: 16,
          ),
          WidgetTextField(
            title: "Confirm New Password",
            isObscure: true,
          ),
        ],
      ),
    );
  }
}
