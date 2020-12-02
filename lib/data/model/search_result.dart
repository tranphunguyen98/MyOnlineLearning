import 'package:my_online_learning/model/entity/author.dart';
import 'package:my_online_learning/model/entity/course.dart';

class SearchResult {
  final List<Course> listCourse;
  final List<Author> listAuthor;

  const SearchResult(this.listCourse, this.listAuthor);

  factory SearchResult.empty() => SearchResult([], []);
}
