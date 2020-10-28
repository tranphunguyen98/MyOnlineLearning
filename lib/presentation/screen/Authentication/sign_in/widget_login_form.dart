import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_text_field.dart';

class WidgetLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          WidgetTextField(
            title: "Email",
          ),
          SizedBox(
            height: 16,
          ),
          WidgetTextField(
            title: "Password",
            isObscure: true,
          ),
        ],
      ),
    );
  }
}
