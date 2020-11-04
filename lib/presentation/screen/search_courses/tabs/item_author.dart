import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ItemAuthorSearch extends StatelessWidget {
  final Author author;

  const ItemAuthorSearch({this.author});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(author.imageUrl),
            ),
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              author.name,
              style: context.textTheme.subtitle2,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "${author.courses.length} courses",
              style: StyleConst.textRegularGray,
            ),
          ],
        ),
      ],
    );
  }
}
