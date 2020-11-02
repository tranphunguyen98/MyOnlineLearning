import 'package:flutter/material.dart';
import 'package:my_online_learning/model/entity/path.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/widget_list_path_search.dart';

import 'page_search_result.dart';

class TabPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageSearchResult(
      Path.listPath.length,
      WidgetListPathSearch(),
    );
  }
}
