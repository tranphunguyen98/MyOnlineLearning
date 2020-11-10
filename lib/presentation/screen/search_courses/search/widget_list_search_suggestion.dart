import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

import 'Item_search_suggestion.dart';

class ListSearchSuggestion extends StatelessWidget {
  final void Function() onPressedItem;

  const ListSearchSuggestion({this.onPressedItem});

  @override
  Widget build(BuildContext context) {
    List<String> listSuggestion = ["Javascript", "Java", "Java 8"];
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
              onPressed: () {},
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
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listSuggestion.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: ItemSearchSuggestion(
                    suggestion: listSuggestion[index],
                    onTap: onPressedItem,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
