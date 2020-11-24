import 'package:json_annotation/json_annotation.dart';

part 'network_user.g.dart';

@JsonSerializable(nullable: false)
class NetworkUser {
  final String id;
  final String userName;
  final String fullName;
  final String urlImage;
  final String email;

  NetworkUser({
    this.id,
    this.userName,
    this.fullName,
    this.urlImage,
    this.email,
  });

  factory NetworkUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkUserFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);
}
