import 'package:json_annotation/json_annotation.dart';

part 'item_author_response.g.dart';

@JsonSerializable(nullable: false)
class ItemAuthorResponse {
  final String id;
  final String name;
  final String avatar;

  ItemAuthorResponse({this.name, this.avatar, this.id});

  factory ItemAuthorResponse.fromJson(Map<String, dynamic> json) =>
      ItemAuthorResponse(
        id: json['id'] as String,
        name: json['user.name'] as String,
        avatar: json['user.avatar'] as String,
      );

  Map<String, dynamic> toJson() => _$ItemAuthorResponseToJson(this);
}
