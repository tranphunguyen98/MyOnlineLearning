import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';

import 'file:///C:/react-native/MyOnlineLearning/lib/presentation/screen/browse_courses/list_of_authors/widget_item_author.dart';

class ListAuthorHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Author.listAuthor.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ItemAuthor(author: Author.listAuthor[index]),
            );
          }),
    );
  }
}
