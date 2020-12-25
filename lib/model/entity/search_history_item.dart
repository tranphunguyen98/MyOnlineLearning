class SearchHistoryItem {
  final String id;
  final String content;

  SearchHistoryItem({this.content, this.id = ""});

  factory SearchHistoryItem.fromJson(Map<String, dynamic> json) =>
      SearchHistoryItem(
        content: json['content'] as String,
        id: json['id'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'content': content,
      };
}
