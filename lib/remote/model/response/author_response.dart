import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_author.dart';

part 'author_response.g.dart';

@JsonSerializable(nullable: false)
class AuthorResponse {
  final NetworkAuthor payload;

  AuthorResponse({this.payload});

  factory AuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorResponseToJson(this);
}
