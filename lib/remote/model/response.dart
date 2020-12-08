import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(nullable: false)
class MyResponse {
  static String kResponseOK = "OK";

  final String message;

  MyResponse({
    this.message,
  });

  bool isSuccess() => message == kResponseOK;

  factory MyResponse.fromJson(Map<String, dynamic> json) =>
      _$MyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyResponseToJson(this);
}
