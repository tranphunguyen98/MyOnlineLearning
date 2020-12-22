import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_course.dart';

part 'network_category.g.dart';

@JsonSerializable(nullable: false)
class NetworkCategory {
  final String id;
  final String name;

  const NetworkCategory({
    this.id = "",
    this.name = "",
  });

  factory NetworkCategory.fromJson(Map<String, dynamic> json) =>
      _$NetworkCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkCategoryToJson(this);
}
