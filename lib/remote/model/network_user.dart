import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_user.g.dart';

@JsonSerializable(nullable: false)
class NetworkUser {
  final String id;
  final String email;
  final String avatar;
  final String username;
  final String phone;
  final String password;
  final String token;

  NetworkUser({
    this.id,
    this.username,
    this.phone,
    this.avatar,
    this.token,
    @required this.email,
    @required this.password,
  });

  factory NetworkUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkUserFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);
}
