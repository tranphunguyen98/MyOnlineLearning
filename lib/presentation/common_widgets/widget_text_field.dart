import 'package:flutter/material.dart';

class WidgetTextField extends StatefulWidget {
  final String title;
  final bool hasObscure;
  final String Function(String) validator;
  final TextEditingController controller;
  const WidgetTextField(
      {this.title, this.hasObscure = false, this.validator, this.controller});

  @override
  _WidgetTextFieldState createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  bool isSecure = false;

  @override
  void initState() {
    isSecure = widget.hasObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.widget.title,
          style: TextStyle(color: Colors.white60),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xff1f242a),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                obscureText: isSecure,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: this.widget.hasObscure
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSecure = !isSecure;
                                });
                              },
                              child: isSecure
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                        )
                      : null,
                ),
              )),
        ),
      ],
    );
  }
}
