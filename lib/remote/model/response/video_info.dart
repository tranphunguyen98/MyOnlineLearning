import 'package:json_annotation/json_annotation.dart';

part 'video_info.g.dart';

@JsonSerializable(nullable: false)
class VideoInfo {
  final String videoUrl;
  final bool isFinish;

  VideoInfo({
    this.videoUrl,
    this.isFinish,
  });

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoInfoToJson(this);
}
