import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/path.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ItemPath extends StatelessWidget {
  final Path path;

  const ItemPath({this.path});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.0,
          height: 60.0,
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//          color: COLOR_CONST.GRAY_LIGHT,
          child: Image(
            image: AssetImage(path.image),
            width: 20.0,
            height: 20.0,
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
              path.title,
              style: context.textTheme.subtitle2,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "${path.courses.length} courses",
              style: StyleConst.textRegularGray,
            ),
          ],
        ),
      ],
    );
  }
}
