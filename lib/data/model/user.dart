import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String userName;
  final String fullName;
  final String urlImage;
  final String email;

  const User({
    @required this.id,
    @required this.userName,
    @required this.fullName,
    @required this.urlImage,
    @required this.email,
  });

  factory User.empty() => User(id: "");
  bool isEmpty() => id == "";

  User copyWith({
    String id,
    String userName,
    String fullName,
    String urlImage,
    String email,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (userName == null || identical(userName, this.userName)) &&
        (fullName == null || identical(fullName, this.fullName)) &&
        (urlImage == null || identical(urlImage, this.urlImage)) &&
        (email == null || identical(email, this.email))) {
      return this;
    }

    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      urlImage: urlImage ?? this.urlImage,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, userName: $userName, fullName: $fullName, urlImage: $urlImage, email: $email}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userName == other.userName &&
          fullName == other.fullName &&
          urlImage == other.urlImage &&
          email == other.email);

  @override
  int get hashCode =>
      id.hashCode ^
      userName.hashCode ^
      fullName.hashCode ^
      urlImage.hashCode ^
      email.hashCode;
}
