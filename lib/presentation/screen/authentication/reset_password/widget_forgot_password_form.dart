import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';

class WidgetForgotPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          WidgetTextField(
            title: "Email",
          ),
        ],
      ),
    );
  }
}
