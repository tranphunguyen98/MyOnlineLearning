import 'package:json_annotation/json_annotation.dart';

part 'cache_user.g.dart';

@JsonSerializable(nullable: false)
class CacheUser {
  final String id;
  final String userName;
  final String fullName;
  final String urlImage;
  final String email;

  CacheUser({
    this.id = "",
    this.userName,
    this.fullName,
    this.urlImage,
    this.email,
  });

  factory CacheUser.fromJson(Map<String, dynamic> json) =>
      _$CacheUserFromJson(json);
  Map<String, dynamic> toJson() => _$CacheUserToJson(this);
}
