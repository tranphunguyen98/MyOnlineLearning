import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

import 'widget_list_author_h.dart';

class WidgetCategoryAuthor extends StatelessWidget {
  final String title;

  const WidgetCategoryAuthor({this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: title),
        ListAuthorHorizontal(),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
