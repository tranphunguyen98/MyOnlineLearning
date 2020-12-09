import 'package:flutter/foundation.dart';
import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';

class SearchResultModel extends ChangeNotifier {
  SearchResult _data = SearchResult.empty();
  bool _isSearching;

  bool isEmpty() {
    return _data.listCourse.isEmpty && _data.listAuthor.isEmpty;
  }

  bool get isLoading => _isSearching;

  void switchToSearchMode() {
    _isSearching = null;
    notifyListeners();
  }

  void _switchToGetResultMode() {
    _isSearching = true;
    notifyListeners();
  }

  Future<void> search(String data) async {
    _switchToGetResultMode();
    print("searching...");
    _data = await getIt<ICourseRepository>().search(data);
    print("searching... $_data");
    _isSearching = false;
    notifyListeners();
    print("searching... $_isSearching");
  }

  bool isGetResultMode() => _isSearching != null;

  set data(SearchResult searchResult) {
    _data = searchResult;
    notifyListeners();
  }

  SearchResult get data => _data;
}
