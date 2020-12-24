// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_author_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAuthorResult _$SearchAuthorResultFromJson(Map<String, dynamic> json) {
  return SearchAuthorResult(
    data: (json['data'] as List)
        .map((e) => NetworkAuthor.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SearchAuthorResultToJson(SearchAuthorResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
