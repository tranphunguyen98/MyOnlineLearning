import 'package:flutter/foundation.dart';
import 'package:my_online_learning/model/entity/search_history_item.dart';

class SearchHistory extends ChangeNotifier {
  final List<SearchHistoryItem> _searchHistory = <SearchHistoryItem>[];
  bool loadedDataFromServer = false;

  List<SearchHistoryItem> get data => _searchHistory;

  void addAll(List<SearchHistoryItem> list) {
    loadedDataFromServer = true;
    _searchHistory.clear();
    _searchHistory.addAll(list);
    notifyListeners();
  }

  void addItem(SearchHistoryItem searchHistoryItem) {
    _searchHistory.add(searchHistoryItem);
    print("add ${searchHistoryItem} ${_searchHistory}");
    notifyListeners();
  }

  void removeItem(SearchHistoryItem searchHistoryItem) {
    _searchHistory.remove(searchHistoryItem);
    notifyListeners();
  }

  void removeAll() {
    _searchHistory.clear();
    notifyListeners();
  }

  bool contain(SearchHistoryItem searchHistoryItem) =>
      _searchHistory.contains(searchHistoryItem);
}
