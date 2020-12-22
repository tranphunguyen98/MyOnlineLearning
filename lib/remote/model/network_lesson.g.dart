// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkLesson _$NetworkLessonFromJson(Map<String, dynamic> json) {
  return NetworkLesson(
    id: json['id'] as String,
    courseId: json['courseId'] as String,
    sectionId: json['sectionId'] as String,
    numberOrder: json['numberOrder'] as int,
    name: json['name'] as String,
    videoUrl: json['videoUrl'] as String,
    hours: (json['hours'] as num).toDouble(),
  );
}

Map<String, dynamic> _$NetworkLessonToJson(NetworkLesson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'sectionId': instance.sectionId,
      'numberOrder': instance.numberOrder,
      'name': instance.name,
      'videoUrl': instance.videoUrl,
      'hours': instance.hours,
    };
