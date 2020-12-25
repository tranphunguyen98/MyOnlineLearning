import 'package:flutter/foundation.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
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

  Future<void> removeAll(String bearerToken) async {
    if (bearerToken.isNotEmpty) {
      final repository = getIt<ICourseRepository>();
      final listSearchHistory = await repository.getSearchHistory(bearerToken);

      var futures = List<Future>();

      // Waif for all futures to complete
      await Future.wait(futures);

      for (final item in listSearchHistory) {
        futures.add(repository.deleteSearchHistory(bearerToken, item.id));
      }

      await Future.wait(futures);
    }

    _searchHistory.clear();
    notifyListeners();
  }

  bool contain(SearchHistoryItem searchHistoryItem) =>
      _searchHistory.contains(searchHistoryItem);
}
