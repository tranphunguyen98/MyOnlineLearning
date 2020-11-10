import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/extensions.dart';

class ItemSearchSuggestion extends StatelessWidget {
  final String suggestion;
  final Function() onTap;
  const ItemSearchSuggestion({this.suggestion, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
          Spacer(
            flex: 1,
          ),
          Icon(
            Icons.delete,
            size: 16.0,
          )
        ],
      ),
    );
  }
}
