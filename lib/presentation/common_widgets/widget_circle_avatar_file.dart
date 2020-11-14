import 'dart:io';

import 'package:flutter/material.dart';

class CircleAvatarFile extends StatelessWidget {
  final File image;
  final double size;

  const CircleAvatarFile({
    Key key,
    @required this.image,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: FileImage(image),
        ),
      ),
    );
  }
}
