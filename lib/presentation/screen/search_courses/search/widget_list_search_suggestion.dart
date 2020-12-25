import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_history.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/search_history_item.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

import 'Item_search_suggestion.dart';

class ListSearchSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<SearchHistory, UserModel>(
        builder: (context, searchHistory, userModel, child) {
      if (userModel.user.token != null && !searchHistory.loadedDataFromServer) {
        return FutureBuilder<List<SearchHistoryItem>>(
            future: getIt<ICourseRepository>()
                .getSearchHistory(userModel.user.bearerToken),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("data: ${snapshot.data.length}");
                if (!searchHistory.loadedDataFromServer) {
                  searchHistory.addAll(snapshot.data);
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          "Recent searches",
                          style: context.textTheme.subtitle2,
                        ),
                        Spacer(),
                        FlatButton(
                          onPressed: () {
                            searchHistory.removeAll();
                          },
                          child: Text(
                            "CLEAR ALL",
                            style: TextStyle(
                              color: context.theme.accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchHistory.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: ItemSearchSuggestion(
                              suggestion: searchHistory.data[index].content,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                print("data: :(");
                return Container();
              }
            });
      } else
        return Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  "Recent searches",
                  style: context.textTheme.subtitle2,
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {
                    searchHistory.removeAll();
                  },
                  child: Text(
                    "CLEAR ALL",
                    style: TextStyle(
                      color: context.theme.accentColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchHistory.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: ItemSearchSuggestion(
                      suggestion: searchHistory.data[index].content,
                    ),
                  );
                },
              ),
            ),
          ],
        );
    });
  }
}
