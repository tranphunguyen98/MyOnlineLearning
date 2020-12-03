import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/item_author.dart';

class WidgetListAuthorSearch extends StatelessWidget {
  final List<Author> listAuthor;
  WidgetListAuthorSearch(this.listAuthor);

  @override
  Widget build(BuildContext context) {
    return listAuthor.isNotEmpty
        ? ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listAuthor.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemAuthorSearch(
                author: listAuthor[index],
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
          )
        : Center(
            child: Text("NO DATA"),
          );
  }
}
