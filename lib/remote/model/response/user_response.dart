import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_user.dart';

part 'user_response.g.dart';

@JsonSerializable(nullable: false)
class UserResponse {
  final String message;
  final NetworkUser userInfo;
  final String token;

  NetworkUser get userInfoWithToken {
    return userInfo.copyWith(token: token);
  }

  UserResponse({
    this.message,
    this.userInfo,
    this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
