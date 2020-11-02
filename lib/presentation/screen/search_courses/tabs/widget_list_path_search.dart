import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/path.dart';

import 'item_path.dart';

class WidgetListPathSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: Path.listPath.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemPath(
          path: Path.listPath[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            color: Colors.white60,
            height: 8,
          ),
        );
      },
    );
  }
}
