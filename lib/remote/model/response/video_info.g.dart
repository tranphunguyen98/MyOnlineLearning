// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) {
  return VideoInfo(
    videoUrl: json['videoUrl'] as String,
    isFinish: json['isFinish'] as bool,
  );
}

Map<String, dynamic> _$VideoInfoToJson(VideoInfo instance) => <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'isFinish': instance.isFinish,
    };
