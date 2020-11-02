import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/widget_list_author_search.dart';

import 'page_search_result.dart';

class TabAuthor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageSearchResult(
      Author.listAuthor.length,
      WidgetListAuthorSearch(),
    );
  }
}
