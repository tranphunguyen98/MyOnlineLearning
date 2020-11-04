import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class CategoryItemLarge extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItemLarge(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: 100.0,
          width: double.infinity,
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
              textAlign: TextAlign.center,
              style: StyleConst.textLarge,
            ),
          ),
        ),
      ],
    );
  }
}
