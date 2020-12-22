import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_search.g.dart';

@JsonSerializable(nullable: false)
class OptionSearch {
  final List<String> category;
  const OptionSearch({this.category});

  factory OptionSearch.fromJson(Map<String, dynamic> json) =>
      _$OptionSearchFromJson(json);
  Map<String, dynamic> toJson() => _$OptionSearchToJson(this);
}
