import 'package:flutter/foundation.dart';
import 'package:my_online_learning/data/model/search_result.dart';
import 'package:my_online_learning/data/repository/course/i_course_repository.dart';
import 'package:my_online_learning/di/injection.dart';
import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/course.dart';
import 'package:my_online_learning/remote/model/option_search.dart';

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

  Future<void> search(String token, String keyword) async {
    _switchToGetResultMode();
    print("searching...");
    List<Course> listCourse = <Course>[];
    print("TOKEN::: $token");
    //if (token.isEmpty) {
    listCourse = await getIt<ICourseRepository>()
        .search(keyword, OptionSearch(category: []));
    // } else {
    //   listCourse = await getIt<ICourseRepository>().searchV2(token, keyword);
    // }

    final listAuthor = <Author>[];

    // listCourse.forEach((course) async {
    //   listAuthor.add(
    //       await getIt<AuthorRepository>().getAuthorDetail(course.instructorId));
    // });

    _data = SearchResult(listCourse, listAuthor);
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
