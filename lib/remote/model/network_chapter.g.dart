// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkChapter _$NetworkChapterFromJson(Map<String, dynamic> json) {
  return NetworkChapter(
    name: json['name'] as String,
    sumHours: (json['sumHours'] as num).toDouble(),
    numberOrder: json['numberOrder'] as int,
    lesson: (json['lesson'] as List)
        .map((e) => NetworkLesson.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as String,
    courseId: json['courseId'] as String,
    isStudying: json['isStudying'] as bool,
  );
}

Map<String, dynamic> _$NetworkChapterToJson(NetworkChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'name': instance.name,
      'sumHours': instance.sumHours,
      'numberOrder': instance.numberOrder,
      'isStudying': instance.isStudying,
      'lesson': instance.lesson,
    };
