import 'package:json_annotation/json_annotation.dart';

import 'item_author_response.dart';

part 'list_author_response.g.dart';

@JsonSerializable(nullable: false)
class ListAuthorResponse {
  final String message;
  final List<ItemAuthorResponse> payload;

  ListAuthorResponse({this.message, this.payload});

  factory ListAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAuthorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListAuthorResponseToJson(this);
}
