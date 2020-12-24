import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_author.dart';

part 'search_author_result.g.dart';

@JsonSerializable(nullable: false)
class SearchAuthorResult {
  final List<NetworkAuthor> data;

  SearchAuthorResult({this.data});

  factory SearchAuthorResult.fromJson(Map<String, dynamic> json) =>
      _$SearchAuthorResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAuthorResultToJson(this);
}
