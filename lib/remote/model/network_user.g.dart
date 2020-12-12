// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkUser _$NetworkUserFromJson(Map<String, dynamic> json) {
  return NetworkUser(
    id: json['id'] as String,
    email: json['email'] as String,
    avatar: json['avatar'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    password: json['password'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$NetworkUserToJson(NetworkUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'token': instance.token,
    };
