import 'package:flutter/material.dart';

import 'Item_search_suggestion.dart';

class ListSearchSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> listSuggestion = ["Javascript", "Java", "Java 8"];
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listSuggestion.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: ItemSearchSuggestion(suggestion: listSuggestion[index]),
            );
          }),
    );
  }
}
