import 'package:my_online_learning/model/entity/course.dart';

class Author {
  final String id;
  final String name;
  final String avatar;
  final List<Course> courses;

  const Author({this.id = "", this.name = "", this.avatar = "", this.courses});

  static List<Author> listAuthor = [];
}
