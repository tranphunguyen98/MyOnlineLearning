import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/presentation/common_widgets/widget_circle_avatar_network.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/list_of_authors/sc_detail_author.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class ItemAuthorSearch extends StatelessWidget {
  final Author author;

  const ItemAuthorSearch({this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AuthorDetailScreen(author.id));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatarNetwork(networkImageUrl: author.avatar, size: 60.0),
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
                "${author.numberCourses} courses",
                style: StyleConst.textRegularGray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
