import 'package:json_annotation/json_annotation.dart';

part 'item_author_response.g.dart';

@JsonSerializable(nullable: false)
class ItemAuthorResponse {
  final String id;

  ItemAuthorResponse({this.id});

  factory ItemAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemAuthorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemAuthorResponseToJson(this);
}
