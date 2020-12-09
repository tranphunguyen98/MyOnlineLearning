import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_history.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/data/model/user_model.dart';
import 'package:my_online_learning/model/entity/search_history_item.dart';
import 'package:my_online_learning/utils/extensions.dart';
import 'package:provider/provider.dart';

class WidgetSearchEditText extends StatelessWidget {
  WidgetSearchEditText();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchResultModel>(builder: (context, searchResult, child) {
      return GestureDetector(
        onTap: () {
          context.read<SearchResultModel>().switchToSearchMode();
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          color: context.theme.primaryColorDark,
          child: TextField(
            controller: _controller,
            autofocus: true,
            enabled: !searchResult.isGetResultMode(),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.left,
            style: context.textTheme.subtitle2,
            onSubmitted: (data) {
              _controller.clear();
              final token = context.read<UserModel>().user.token ?? "";
              searchResult.search(token, data);
              context.read<SearchHistory>().addItem(SearchHistoryItem(data));
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              hintText: "Search...",
              hintStyle: context.textTheme.subtitle2,
            ),
          ),
        ),
      );
    });
  }
}
