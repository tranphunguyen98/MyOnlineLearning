import 'package:flutter/material.dart';

class CircleAvatarNormal extends StatelessWidget {
  final String assetImageUrl;
  final double size;

  const CircleAvatarNormal({
    Key key,
    @required this.assetImageUrl,
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
          image: AssetImage(assetImageUrl),
        ),
      ),
    );
  }
}
