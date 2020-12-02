import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/widget_list_search_suggestion.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/widget_search_edittext.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/widget_tabs.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: context.theme.primaryColorDark));
    return Scaffold(
      body: Consumer<SearchResultModel>(
        builder: (_, searchResult, __) => Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: context.theme.backgroundColor,
            child: Column(
              children: [
                WidgetSearchEditText(),
                Expanded(
                    child: searchResult.isGetResultMode()
                        ? TabResultSearch()
                        : ListSearchSuggestion()),
              ],
            )),
      ),
    );
  }
}
