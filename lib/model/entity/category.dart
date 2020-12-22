import 'course.dart';

class Category {
  final String id, title, image;
  final List<Course> courses;

  const Category({this.id, this.title, this.courses, this.image = ""});

  static const List<Category> categories = [];
}
