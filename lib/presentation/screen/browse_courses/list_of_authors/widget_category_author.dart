import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/course_study/course_detail/item_section.dart';

import 'widget_list_author_h.dart';

class WidgetCategoryAuthor extends StatelessWidget {
  final String title;

  const WidgetCategoryAuthor({this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderAuthor(title: title),
        ListAuthorHorizontal(),
      ],
    );
  }
}
