import 'package:my_online_learning/model/entity/course.dart';

class Author {
  final String id;
  final String name;
  final String avatar;
  final List<Course> courses;
  final String numberCourses;

  const Author(
      {this.id = "",
      this.name = "",
      this.avatar = "",
      this.courses,
      this.numberCourses});

  static List<Author> listAuthor = [];
}
