import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/logo.svg',
          semanticsLabel: 'Acme Logo',
          width: 100,
          height: 100,
        ),
        Text(
          "ONLINE LEARNING",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
