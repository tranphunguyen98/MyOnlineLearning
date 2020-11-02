import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/widget_search_edittext.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/widget_tabs.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: COLOR_CONST.GRAY_DARK));
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: COLOR_CONST.BACKGROUND_DARK,
          child: Column(
            children: [
              WidgetSearchEditText(),
              //ListSearchSuggestion(),
              TabResultSearch(),
            ],
          )),
    );
  }
}
