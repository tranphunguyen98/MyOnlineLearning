import 'package:flutter/material.dart';
import 'package:my_online_learning/presentation/screen/browse_courses/home/widget_list_author_h.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class WidgetCategoryAuthor extends StatelessWidget {
  final String title;

  const WidgetCategoryAuthor({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        ListAuthorHorizontal(),
      ],
    );
  }

  _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            style: STYLE_CONST.textRegular,
          ),
        ],
      ),
    );
  }
}
