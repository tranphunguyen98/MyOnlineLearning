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

  const NetworkUser({
    @required this.id,
    @required this.email,
    @required this.avatar,
    @required this.username,
    @required this.phone,
    @required this.password,
    @required this.token,
  });

  factory NetworkUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkUserFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);

  NetworkUser copyWith({
    String id,
    String email,
    String avatar,
    String username,
    String phone,
    String password,
    String token,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (email == null || identical(email, this.email)) &&
        (avatar == null || identical(avatar, this.avatar)) &&
        (username == null || identical(username, this.username)) &&
        (phone == null || identical(phone, this.phone)) &&
        (password == null || identical(password, this.password)) &&
        (token == null || identical(token, this.token))) {
      return this;
    }

    return NetworkUser(
      id: id ?? this.id,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'NetworkUser{id: $id, email: $email, avatar: $avatar, username: $username, phone: $phone, password: $password, token: $token}';
  }
}
