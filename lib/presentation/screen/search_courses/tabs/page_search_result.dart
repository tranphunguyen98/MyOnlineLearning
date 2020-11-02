import 'package:flutter/material.dart';
import 'package:my_online_learning/utils/my_const/my_const.dart';

class PageSearchResult extends StatelessWidget {
  final int numberOfResults;
  final Widget listResult;

  const PageSearchResult(this.numberOfResults, this.listResult);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          STYLE_CONST.spaceHorizontalRegular,
          Text(
            "$numberOfResults Results",
            style: STYLE_CONST.textRegularGray,
          ),
          STYLE_CONST.spaceHorizontalRegular,
          Expanded(child: listResult),
        ],
      ),
    );
    ;
  }
}
