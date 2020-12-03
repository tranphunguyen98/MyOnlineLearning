import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_authors/sc_detail_author.dart';
import 'package:my_online_learning/utils/extensions.dart';

class ItemAuthorSearchDivider extends StatelessWidget {
  final Author author;

  const ItemAuthorSearchDivider({this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AuthorDetailScreen(author.id));
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(author.avatar),
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
                    //TODO style: context.textTheme.subtitle2Gray,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              color: Colors.white60,
              height: 8,
            ),
          )
        ],
      ),
    );
  }
}
