import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/response/video_info.dart';

part 'video_response.g.dart';

@JsonSerializable(nullable: false)
class VideoResponse {
  final String message;
  final VideoInfo payload;

  VideoResponse({this.message, this.payload});

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);

  @override
  String toString() {
    return "$message : ${payload.toString()}";
  }
}
