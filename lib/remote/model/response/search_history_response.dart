import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/model/entity/search_history_item.dart';

import 'list_search_history_response.dart';

part 'search_history_response.g.dart';

@JsonSerializable(nullable: false)
class SearchHistoryResponse {
  final String message;
  final ListSearchHistoryResponse payload;

  SearchHistoryResponse({this.payload, this.message});

  factory SearchHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHistoryResponseToJson(this);
}
