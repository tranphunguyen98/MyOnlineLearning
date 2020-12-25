// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSearchHistoryResponse _$ListSearchHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return ListSearchHistoryResponse(
    data: (json['data'] as List)
        .map((e) => SearchHistoryItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListSearchHistoryResponseToJson(
        ListSearchHistoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
