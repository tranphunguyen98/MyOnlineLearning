import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/COLOR_CONST.dart';

class WidgetTextField extends StatelessWidget {
  final String title;
  final bool isObscure;

  const WidgetTextField({this.title, this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: TextStyle(color: Colors.white60),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: COLOR_CONST.GRAY,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                obscureText: this.isObscure,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: this.isObscure
                      ? const Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const Icon(Icons.visibility),
                        )
                      : null,
                ),
              )),
        ),
      ],
    );
  }
}
