import 'package:json_annotation/json_annotation.dart';
import 'package:my_online_learning/remote/model/network_category.dart';

part 'list_category_response.g.dart';

@JsonSerializable(nullable: false)
class ListCategoryResponse {
  final List<NetworkCategory> payload;

  ListCategoryResponse({this.payload});

  factory ListCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryResponseToJson(this);
}
