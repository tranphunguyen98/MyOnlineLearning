// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCourse _$NetworkCourseFromJson(Map<String, dynamic> json) {
  return NetworkCourse(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
    ratedNumber: json['ratedNumber'] as int,
    totalHours: (json['totalHours'] as num).toDouble(),
    imageUrl: json['imageUrl'] as String,
    updatedAt: json['updatedAt'] as String,
    instructorId: json['instructorId'] as String,
    instructorName: json['instructorName'] as String,
    instructorAvatar: json['instructorAvatar'] as String,
  );
}

Map<String, dynamic> _$NetworkCourseToJson(NetworkCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'description': instance.description,
      'ratedNumber': instance.ratedNumber,
      'totalHours': instance.totalHours,
      'imageUrl': instance.imageUrl,
      'updatedAt': instance.updatedAt,
      'instructorId': instance.instructorId,
      'instructorName': instance.instructorName,
      'instructorAvatar': instance.instructorAvatar,
    };
