import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(nullable: false)
class MessageResponse {
  static String kResponseOK = "OK";

  final String message;

  MessageResponse({
    this.message,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}
