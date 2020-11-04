import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/utils/extensions.dart';

class ItemAuthor extends StatelessWidget {
  final Author author;

  const ItemAuthor({this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(author.imageUrl))),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          author.name,
          style: context.textTheme.subtitle2,
        )
      ],
    );
  }
}
