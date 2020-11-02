import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/item_author.dart';

class WidgetListAuthorSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: Author.listAuthor.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemAuthorSearch(
          author: Author.listAuthor[index],
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
