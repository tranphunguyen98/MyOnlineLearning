// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    message: json['message'] as String,
    userInfo: NetworkUser.fromJson(json['userInfo'] as Map<String, dynamic>),
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userInfo': instance.userInfo,
      'token': instance.token,
    };
