import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

part 'network_author.g.dart';

@JsonSerializable(nullable: false)
class NetworkAuthor {
  final String id;
  final String name;
  final String avatar;
  final List<NetworkCourse> courses;

  const NetworkAuthor(
      {this.id = "", this.name = "", this.avatar = "", this.courses});

  factory NetworkAuthor.fromJson(Map<String, dynamic> json) =>
      _$NetworkAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkAuthorToJson(this);
}
