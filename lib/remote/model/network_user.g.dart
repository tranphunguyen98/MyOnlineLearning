// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkUser _$NetworkUserFromJson(Map<String, dynamic> json) {
  return NetworkUser(
    id: json['id'] as String,
    userName: json['userName'] as String,
    fullName: json['fullName'] as String,
    urlImage: json['urlImage'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$NetworkUserToJson(NetworkUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'urlImage': instance.urlImage,
      'email': instance.email,
    };
