import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/widget_list_author_search.dart';
import 'package:provider/provider.dart';

import 'page_search_result.dart';

class TabAuthor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultModel>(
      builder: (context, searchResult, child) => PageSearchResult(
        searchResult.data.listAuthor.length,
        WidgetListAuthorSearch(searchResult.data.listAuthor),
      ),
    );
  }
}
