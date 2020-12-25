import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/model/entity/search_history_item.dart';

part 'list_search_history_response.g.dart';

@JsonSerializable(nullable: false)
class ListSearchHistoryResponse {
  final List<SearchHistoryItem> data;

  ListSearchHistoryResponse({this.data});

  factory ListSearchHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSearchHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListSearchHistoryResponseToJson(this);
}
