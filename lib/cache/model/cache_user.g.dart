// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheUser _$CacheUserFromJson(Map<String, dynamic> json) {
  return CacheUser(
    id: json['id'] as String,
    userName: json['userName'] as String,
    fullName: json['fullName'] as String,
    urlImage: json['urlImage'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$CacheUserToJson(CacheUser instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'urlImage': instance.urlImage,
      'email': instance.email,
    };
