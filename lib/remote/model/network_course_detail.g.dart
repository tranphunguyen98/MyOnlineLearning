// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_course_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCourseDetail _$NetworkCourseDetailFromJson(Map<String, dynamic> json) {
  return NetworkCourseDetail(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
    ratedNumber: json['ratedNumber'] as int,
    totalHours: (json['totalHours'] as num).toDouble(),
    imageUrl: json['imageUrl'] as String,
    promoVidUrl: json['promoVidUrl'] as String,
    updatedAt: json['updatedAt'] as String,
    instructorId: json['instructorId'] as String,
    instructorName: json['instructorName'] as String,
    section: (json['section'] as List)
        .map((e) => NetworkChapter.fromJson(e as Map<String, dynamic>))
        .toList(),
    instructor:
        NetworkAuthor.fromJson(json['instructor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkCourseDetailToJson(
        NetworkCourseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'description': instance.description,
      'ratedNumber': instance.ratedNumber,
      'totalHours': instance.totalHours,
      'imageUrl': instance.imageUrl,
      'promoVidUrl': instance.promoVidUrl,
      'updatedAt': instance.updatedAt,
      'instructorId': instance.instructorId,
      'instructorName': instance.instructorName,
      'section': instance.section,
      'instructor': instance.instructor,
    };
