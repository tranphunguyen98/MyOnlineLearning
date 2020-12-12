import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String username;
  final String phone;
  final String avatar;
  final String email;
  final String password;
  final String token;

  const User({
    @required this.id,
    @required this.username,
    @required this.phone,
    @required this.avatar,
    @required this.email,
    @required this.password,
    @required this.token,
  });

  factory User.empty() => User(id: "");

  bool isEmpty() => id == "";

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  User copyWith({
    String id,
    String name,
    String phone,
    String avatar,
    String email,
    String password,
    String token,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.username)) &&
        (phone == null || identical(phone, this.phone)) &&
        (avatar == null || identical(avatar, this.avatar)) &&
        (email == null || identical(email, this.email)) &&
        (password == null || identical(password, this.password)) &&
        (token == null || identical(token, this.token))) {
      return this;
    }

    return User(
      id: id ?? this.id,
      username: name ?? this.username,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $username, phone: $phone, avatar: $avatar, email: $email, password: $password, token: $token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          phone == other.phone &&
          avatar == other.avatar &&
          email == other.email &&
          password == other.password &&
          token == other.token);

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      phone.hashCode ^
      avatar.hashCode ^
      email.hashCode ^
      password.hashCode ^
      token.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      id: map['id'] as String,
      username: map['name'] as String,
      phone: map['phone'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.username,
      'phone': this.phone,
      'avatar': this.avatar,
      'email': this.email,
      'password': this.password,
      'token': this.token,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
