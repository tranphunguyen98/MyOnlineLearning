import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class ItemSearchSuggestion extends StatelessWidget {
  final String suggestion;

  const ItemSearchSuggestion({this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 16.0,
        ),
        Text(
          suggestion,
          style: context.textTheme.subtitle2,
        ),
      ],
    );
  }
}
