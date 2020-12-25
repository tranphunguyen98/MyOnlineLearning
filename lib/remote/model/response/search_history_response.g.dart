// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHistoryResponse _$SearchHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return SearchHistoryResponse(
    payload: ListSearchHistoryResponse.fromJson(
        json['payload'] as Map<String, dynamic>),
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$SearchHistoryResponseToJson(
        SearchHistoryResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
