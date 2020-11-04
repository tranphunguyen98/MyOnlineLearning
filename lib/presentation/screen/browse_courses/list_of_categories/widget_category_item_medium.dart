import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class CategoryItemMedium extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItemMedium(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 80.0,
          width: 140.0,
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black26,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: StyleConst.textMediumBold,
            ),
          ),
        ),
      ],
    );
  }
}
