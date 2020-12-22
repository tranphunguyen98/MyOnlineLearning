// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionSearch _$OptionSearchFromJson(Map<String, dynamic> json) {
  return OptionSearch(
    category: (json['category'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$OptionSearchToJson(OptionSearch instance) =>
    <String, dynamic>{
      'category': instance.category,
    };
