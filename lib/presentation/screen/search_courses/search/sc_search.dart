import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/widget_list_search_suggestion.dart';
import 'package:my_online_learning/presentation/screen/search_courses/search/widget_search_edittext.dart';
import 'package:my_online_learning/presentation/screen/search_courses/tabs/widget_tabs.dart';
import 'package:my_online_learning/utils/extensions.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: context.theme.primaryColorDark));
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              WidgetSearchEditText(
                onTap: () {
                  setState(() {
                    isSearching = true;
                  });
                },
              ),
              Expanded(
                  child: isSearching
                      ? ListSearchSuggestion(
                          onPressedItem: () {
                            setState(() {
                              isSearching = false;
                            });
                          },
                        )
                      : TabResultSearch()),
            ],
          )),
    );
  }
}
