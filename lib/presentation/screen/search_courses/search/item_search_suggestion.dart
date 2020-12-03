import 'package:flutter/material.dart';
import 'package:my_online_learning/data/model/search_result_model.dart';
import 'package:my_online_learning/utils/extensions.dart';
import "package:provider/provider.dart";

class ItemSearchSuggestion extends StatelessWidget {
  final String suggestion;
  const ItemSearchSuggestion({this.suggestion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SearchResultModel>().search(suggestion);
      },
      child: Row(
        children: [
          SizedBox(
            width: 8.0,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              suggestion,
              style: context.textTheme.subtitle2,
            ),
          ),
          // Spacer(
          //   flex: 1,
          // ),
          // Icon(
          //   Icons.delete,
          //   size: 16.0,
          // )
        ],
      ),
    );
  }
}
